// #![feature(deque_make_contiguous)]
use std::cmp::{max, min};
use std::vec::IntoIter;
use std::collections::vec_deque::VecDeque;

use tri_mesh::prelude::*;

use crate::contour::CellSet;
use crate::contour::Cntr;


pub(crate) const DISTANCE: i32 = 2;
pub(crate) const GRID_SIZE: usize = 6;

type Vec2 = Point2<f64>;
// pub(crate) type PolyLine = Vec<Point2<i32>>;

#[derive(Clone)]
pub(crate) struct PolyLine {
    pub(crate) nodes: Vec<Point2<i32>>,
    pub(crate) grid_size: i16,
}

impl<'a> PolyLine {
    pub(crate) fn new(pts: Vec<Point2<i32>>, grid_size: i16) -> Self {
        Self {
            //nodes: Vec::with_capacity(100),
            nodes: pts,
            grid_size: grid_size,
        }
    }

    pub(crate) fn to_cntr(&self, n_points: usize) -> Cntr {
        self.line2points(n_points)
    }

    fn line2points(&self, n: usize) -> Cntr {
        let mut l: f64 = 0.0;

        let mut res: Cntr = Cntr::new(None, self.grid_size);
        let line2: Cntr = Cntr::new(Some(self.nodes.iter().map(|v| Point2::new(v.x as f64 + 0.5, v.y as f64 + 0.5)).collect()), self.grid_size);

        let mut p1 = line2.points[0];
        let mut ll: Vec<(Point2<f64>, f64)> = vec![(p1, 0.0)];

        for p2 in line2.points[1..].iter() {
            l = l + p1.distance(*p2);
            ll.push((*p2, l));
            p1 = *p2;
        }

        let tot_len = ll.last().unwrap().1;
        let dl = tot_len / n as f64;
        let mut m = 0;
        let mut p = ll[0].0;

        res.push(ll[0].0);

        for k in 1..n {
            let r: f64 = (k as f64) * dl;
            while m < ll.len() {
                let l = ll[m].1;
                if r < l {
                    // cur_path = r;
                    break;
                }
                p = ll[m].0;
                m += 1;
            }

            let s1 = ll[m - 1];
            let s2 = ll[m];
            //     # px = (p2[0] - p1[0]) / l * dl # TODO!!!
            //     # py = (p2[1] - p1[1]) / l * dl # TODO!!!

            let dd = r - s1.1;
            //let (mut dx, mut dy): (f64, f64) = (0.0, 0.0);
            let (dx, dy): (f64, f64) =
                if (s2.0.x - s1.0.x).abs() > 1.0e-10 {
                    let kk = (s2.0.y - s1.0.y) / (s2.0.x - s1.0.x);
                    let dx = dd / (1.0 + kk*kk).sqrt();
                    let dy = kk * dx;
                    (dx, dy)
                }
                else {
                    let dx = 0.0;
                    let dy = dd;
                    (dx, dy)
                };

            res.push(Point2 {x: p.x + dx, y: p.y + dy} );
        }
        res
    }
}


pub(crate) struct GenPolyLines {
    cells: CellSet,
    line_buf: PolyLine,
    lev: i32,
}

impl GenPolyLines {
    pub(crate) fn new(z: CellSet, grid_size: i16) -> Self {
        Self {
            cells: z,
            line_buf: PolyLine::new(Vec::with_capacity(100), grid_size),
            lev: 0,
        }
    }

    fn sco2(v1: &Cntr, v2: &Cntr) -> f64 {
        let mut s = 0f64;

        for (a1, a2) in v1.points.iter().zip(v2.points.iter()) {
            s += (a2.x - a1.x) * (a2.x - a1.x) + (a2.y - a1.y) * (a2.y - a1.y)
        }
        s / (v1.points.len() as f64)
    }

    pub (crate) fn select_top(cntrs: &Vec<Vec<Vec2>>, grid_size: i16, n: usize) -> Vec<(f64, PolyLine)> {

        let mut top_heap: VecDeque<(f64, PolyLine)> = VecDeque::with_capacity(n);
        // TODO: select strt point from self.cells

        for cntr in cntrs.iter() {
            let cn = Cntr::new(Some(cntr.to_vec()), grid_size);
            let zone = cn.line_zone();

            let mut gen_lines = GenPolyLines::new(zone, grid_size);
            let start_point = Point2 { x: 0, y: 0 };
            gen_lines.line_buf.nodes.push(start_point);

            let cntr_size = cn.points.len();
            let calc_sco = |pl: &PolyLine| GenPolyLines::sco2(&cn, &pl.to_cntr(cntr_size));

            let mut ff = |pl: &PolyLine| {
                let d = calc_sco(pl);
                let len = top_heap.len();
                if len > 0 {
                    if d < top_heap.get(len - 1).unwrap().0 || len <= n {
                        if len == n {
                            top_heap.pop_front();
                        }
                        top_heap.push_back((d, pl.clone()));
                        top_heap.make_contiguous().sort_by(|a, b| b.0.partial_cmp(&a.0).unwrap());
                    }
                } else {
                    top_heap.push_back((d, pl.clone()));
                    // top_heap.make_contiguous().sort_by(|a, b| b.0.partial_cmp(&a.0).unwrap());
                }
            };

            gen_lines.complete_line(&mut ff);
        }
        let v = top_heap.iter().cloned().collect();

        v

    }

    fn complete_line<F>(&mut self, f: &mut F)
        where
            F: FnMut(&PolyLine) {

        self.lev += 1;
        // println!("Enter {} with line_buf: {:?}", self.lev, self.line_buf.nodes);
        let start_point = self.line_buf.nodes.last().unwrap().clone();
        let first_point = self.line_buf.nodes.first().unwrap().clone();
        let neib_nodes = NeiborNodes::new(&self.cells, &self.line_buf, start_point, self.line_buf.grid_size);

        let last = self.line_buf.nodes.last().unwrap();
        // println!("point: {:?}, neibs: {:?}", last, neib_nodes.neibs);
        let len = neib_nodes.neibs.len();

        // for (i, v1) in neib_nodes.neibs.iter().enumerate() {
        //     for (j, v2) in neib_nodes.neibs.iter().enumerate() {
        //         if j > i && v1 == v2 {
        //
        //             println!("Start point: {:?}", start_point); // self.line_buf.nodes);
        //             println!("Doubled neibs: {:?}", neib_nodes.neibs); // self.line_buf.nodes);
        //         }
        //     }
        // }

        for p in neib_nodes.into_iter() {
            if p == first_point {
                // println!("line_buf: {:?}", self.line_buf.nodes);
                self.line_buf.nodes.push(p);
                (*f)(&self.line_buf);
                self.line_buf.nodes.pop();
                continue;
            }

            self.line_buf.nodes.push(p);
            self.complete_line(f);
            self.line_buf.nodes.pop();
        }
        // println!("Exit {}", self.lev);
        self.lev -= 1;
    }
}


#[derive(Clone)]
struct NeiborNodes {
    pub(crate) neibs: Vec<Point2<i32>>,
    grid_size: i16,
}

impl NeiborNodes {
    fn new(permited_points: &CellSet, line: &PolyLine, start_point: Point2<i32>, grid_size: i16) -> Self {
        // println!("permitted_points: {:?}", permited_points);
        Self {
            //cells: permited_points,
            //cur_point: start_point,
            neibs: Self::near_points(permited_points, line, start_point, DISTANCE, grid_size),
            grid_size: grid_size,
        }
    }

    fn near_points(z: &CellSet, line: &PolyLine, start_point: Point2<i32>, dist: i32, grid_size: i16) -> Vec<Point2<i32>> {
        let gsize = grid_size as i32;
        let chk_zone = |i: i32, j: i32, z: &CellSet, line: &PolyLine| -> bool {
            if i < 0 || i >= gsize || j < 0 || j >= gsize {
                return false;
            }

            let first = line.nodes.first().unwrap().clone();
            // println!("first: {:?}", first);
            if first == (Point2{x:i, y: j}) && line.nodes.len() > 5 {
                //println!("first: {:?}", first);
                return true;
            }
            if !z.contains(&(i, j)) {
                return false;
            }
            for p in line.nodes.iter() {
                let Point2{x: pi, y: pj} = *p;
                if (pi - i).abs() < dist as i32 && (pj - j).abs() < dist as i32{
                    return false
                }
            }
            true
        };

        let Point2{x:i0, y:j0} = start_point;
        let mut v: Vec<Point2<i32>> = Vec::with_capacity(((grid_size - 1) * 4) as usize);

        let min_i = i0 - dist;
        let min_j = j0 - dist + 1;
        let max_i = i0 + dist;
        let max_j = j0 + dist - 1;

        for i in min_i..=max_i {
            let j = min_j - 1;
            if chk_zone(i, j, z, line) {
                v.push(Point2::new(i, j));
            }
        }

        for j in min_j..=max_j{
            let i = max_i;
            if chk_zone(i, j, z, line) {
                v.push(Point2::new(i, j));
            }
        }

        for i in min_i..=max_i {
            let j = max_j + 1;
            if chk_zone(i, j, z, line) {
                v.push(Point2::new(i, j));
            }
        }

        for j in min_j..=max_j {
            let i = min_i;
            if chk_zone(i, j, z, line) {
                v.push(Point2::new(i, j));
            }
        }

        v.clone()
    }
}

impl IntoIterator for NeiborNodes {
    type Item = Point2<i32>;
    type IntoIter = NeiborNodesIter;

    // note that into_iter() is consuming self
    fn into_iter(self) -> Self::IntoIter {
        Self::IntoIter {
            iter: self.neibs.into_iter(),
        }
    }
}

struct NeiborNodesIter {
    iter: IntoIter<Point2<i32>>,
}

impl<'a> Iterator for NeiborNodesIter {
    type Item = Point2<i32>;

    fn next(&mut self) -> Option<Self::Item> {
        self.iter.next()
    }
}
