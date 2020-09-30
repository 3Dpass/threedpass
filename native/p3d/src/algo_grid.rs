use crypto::digest::Digest;
use crypto::sha2::Sha256;

use std::ops::SubAssign;
use std::collections::HashSet;

extern crate peroxide;
use peroxide::numerical::eigen;
use peroxide::numerical::eigen::EigenMethod;
use peroxide::fuga::*;

use ndarray::{Array1, Array2, Array3, Axis, ArrayView2, ArrayView1, ArrayBase};
use ndarray::{arr1, arr2};

use tri_mesh::prelude::*;
//use cgmath::Vector2;

use crate::contour::Cntr;
use crate::polyline::PolyLine;
use crate::polyline::GenPolyLines;

type VctrTriangles = Array3<f64>;
//type Triangle = Array3<f64>;
// [[x0, y0, z0],[x1, y1, z1],[x3, y3, z3]]
// [[x0, y0, z0],[x1, y1, z1],[x3, y3, z3]]
// [[x0, y0, z0],[x1, y1, z1],[x3, y3, z3]]
type Vec2 = Point2<f64>;


pub(crate) fn find_top_std(depth: usize, grid_size: i16, cntrs: &Vec<Vec<Vec2>>) -> Vec<String> {
    //let cn = Cntr::new(Some(cntr.to_vec()), grid_size);
    // let zone = cn.line_zone();
    //
    // let mut z_all: HashSet<(i32, i32)> = HashSet::new();
    // for i in 0..6 {
    //     for j in 0..6 {
    //         z_all.insert((i, j));
    //     }
    // }
    //
    // let zz = z_all.difference(&zone);
    // println!("{:?}", zz);

    //let mut gen_lines = GenPolyLines::new(zone, grid_size);
    //let cntr_size = cn.points.len();
    // let calc_sco = |pl: &PolyLine| sco2(&cn, &pl.to_cntr(cntr_size));
    let ss = GenPolyLines::select_top(cntrs, grid_size, depth); //, calc_sco);
    let mut res: Vec<PolyLine> = vec![];
    let mut hashes = vec![];
    let ll = ss.len();

    for a in ss[0..depth].iter() {
        res.push(a.1.clone());

        let mut hasher = Sha256::new();
        //hasher.input_str(&"test");
        //hasher.input(a.1.nodes.as_slice().into());
        let b = format!("{:?}", a.1.nodes.as_slice());
        //println!("{:?}", a.1.nodes.as_slice());
        hasher.input_str(b.as_str());

        hashes.push(hasher.result_str());
    }
    hashes
}

//--------------------------------------------------------

//use std::iter::SourceIter;
//use std::array::FixedSizeArray;

//type Vctr = Array1<Vector2<f64>>;


// fn sco(mut v1: Vctr, mut v2: Vctr) -> f64 {
//     let mut s = 0f64;
//     //let a = vec2(1f64, 2f64);
//     Zip::from(&v1).and(&v2).apply(|&a1, &a2| s += a1.distance(a2));
//     s
// }

// fn sco2(v1: &Cntr, v2: &Cntr) -> f64 {
//     let mut s = 0f64;
//
//     for (a1, a2) in v1.points.iter().zip(v2.points.iter()) {
//         s += (a2.x - a1.x) * (a2.x - a1.x) + (a2.y - a1.y) * (a2.y - a1.y)
//     }
//     s / (v1.points.len() as f64)
// }


fn cross(triangles: &VctrTriangles) -> Array2<f64> {
    let dims = triangles.dim();
    let mut d = Array3::zeros((dims.0, 2, dims.1));

    for (i, m) in triangles.axis_iter(Axis(0)).enumerate() {
        for (j, p) in m.axis_iter(Axis(1)).enumerate() {
            d[[i, 0, j]] = p[1] - p[0];
            d[[i, 1, j]] = p[2] - p[1];
        }
    }

    let mut cr = Array2::zeros((dims.0, dims.1));

    for (i, m) in d.axis_iter(Axis(0)).enumerate() {
            let a: ArrayView1<f64> = m.slice(s![0, ..]);
            let b: ArrayView1<f64> = m.slice(s![1, ..]);
            cr[[i, 0]] = a[1]*b[2] - a[2]*b[1];
            cr[[i, 1]] = a[2]*b[0] - a[0]*b[2];
            cr[[i, 2]] = a[0]*b[1] - a[1]*b[0];
    }

    cr
}


pub fn mass_properties(triangles: VctrTriangles) -> (Array1<f64>, Array2<f64>) {
    let p0: ArrayView2<f64> = triangles.slice(s![0.., 0, 0..]);
    let p1: ArrayView2<f64> = triangles.slice(s![0.., 1, 0..]);
    let p2: ArrayView2<f64> = triangles.slice(s![0.., 2, 0..]);

    let f1 = &p0 + &p1 + &p2;
    let f2 = &p0 * &p0 + &p1 * &p1 + &p0 * &p1 + &p1 * &f1;
    let f3 = &p0 * &p0 * &p0 + &p0 * &p0 * &p1 + &p0 * &p1 * &p1 + &p1 * &p1 * &p1 + &p2 * &f2;

    let g0 = &(&f2 + &(&(&p0 + &f1) * &p0));
    let g1 = &(&f2 + &(&(&p1 + &f1) * &p1));
    let g2 = &(&f2 + &(&(&p2 + &f1) * &p2));

    let d = f1.nrows();
    let mut integral: Array2<f64> = Array2::zeros((10, d));


    // println!("Triangles:");
    // println!("{:?}", triangles.slice(s![0, .., ..]));
    // println!("{:?}", triangles.slice(s![1, .., ..]));

    let crosses = cross(&triangles);

    // println!("crosses: {}, {}, {}", crosses.slice(s![0, ..]), crosses.slice(s![1, ..]), crosses.slice(s![2, ..]));


    integral.slice_mut(s![0..1, ..]).assign(&(&crosses.slice(s![.., 0]) * &f1.slice(s![.., 0])));
    integral.slice_mut(s![1..4, ..]).assign(&(&crosses * &f2).t().slice(s![.., ..]));
    integral.slice_mut(s![4..7, ..]).assign(&(&crosses * &f3).t().slice(s![.., ..]));

    // println!("Integral:");
    // println!("{}, {}, {}", integral[[0, 0]], integral[[0,1]], integral[[0,2]]);
    // println!("{}, {}, {}", integral[[1, 0]], integral[[1,1]], integral[[1,2]]);
    // println!("{}, {}, {}", integral[[2, 0]], integral[[2,1]], integral[[2,2]]);
    // println!("{}, {}, {}", integral[[3, 0]], integral[[3,1]], integral[[3,2]]);
    // println!("{}, {}, {}", integral[[4, 0]], integral[[4,1]], integral[[4,2]]);
    // println!("{}, {}, {}", integral[[5, 0]], integral[[5,1]], integral[[5,2]]);
    // println!("{}, {}, {}", integral[[6, 0]], integral[[6,1]], integral[[6,2]]);

    for i in 0..3 {
        let triangle_i = (i + 1) % 3;
        integral.slice_mut(s![i+7, ..]).assign(
            &(&crosses.slice(s![.., i]) * &(
                    &triangles.slice(s![.., 0, triangle_i]) * &g0.slice(s![.., i]) +
                    &triangles.slice(s![.., 0, triangle_i]) * &g1.slice(s![.., i]) +
                    &triangles.slice(s![.., 0, triangle_i]) * &g2.slice(s![.., i]))
            )
        );
    }

    // println!("{}, {}, {}", integral[[7, 0]], integral[[7,1]], integral[[7,2]]);
    // println!("{}, {}, {}", integral[[8, 0]], integral[[8,1]], integral[[8,2]]);
    // println!("{}, {}, {}", integral[[9, 0]], integral[[9,1]], integral[[9,2]]);


    let coefficients: Array1<f64> =  arr1(&[1./6., 1./24., 1./24., 1./24., 1./60., 1./60., 1./60., 1./120., 1./120., 1./120.]);
    let integrated: Array1<f64> = integral.sum_axis(Axis(1)) * coefficients;
    let volume = integrated[0];
    let center_mass: Array1<f64> = if volume.abs() < 1e-10 {
        arr1(&[0., 0., 0.])
    }
    else {
        let a = &integrated.slice(s![1..4]);
        a / volume
    };

    let density = 1.0;
    //let mass = density * volume;


    // inertia = np.zeros((3, 3))
    // inertia[0, 0] = integrated[5] + integrated[6] - \
    // (volume * (center_mass[[1, 2]]**2).sum())
    // inertia[1, 1] = integrated[4] + integrated[6] - \
    // (volume * (center_mass[[0, 2]]**2).sum())
    // inertia[2, 2] = integrated[4] + integrated[5] - \
    // (volume * (center_mass[[0, 1]]**2).sum())
    // inertia[0, 1] = (
    //     integrated[7] - (volume * np.product(center_mass[[0, 1]])))
    // inertia[1, 2] = (
    //     integrated[8] - (volume * np.product(center_mass[[1, 2]])))
    // inertia[0, 2] = (
    //     integrated[9] - (volume * np.product(center_mass[[0, 2]])))
    // inertia[2, 0] = inertia[0, 2]
    // inertia[2, 1] = inertia[1, 2]
    // inertia[1, 0] = inertia[0, 1]
    // inertia *= density
    // result['inertia'] = inertia
    //
    // return result

    let mut inertia: Array2<f64> = Array2::zeros((3, 3));

    inertia[[0, 0]] = integrated[5] + integrated[6] -
        volume * (center_mass[1].powi(2) + center_mass[2].powi(2));

    inertia[[1, 1]] = integrated[4] + integrated[6] -
        volume * (center_mass[0].powi(2) + center_mass[2].powi(2));

    inertia[[2, 2]] = integrated[4] + integrated[5] -
        volume * (center_mass[0].powi(2) + center_mass[1].powi(2));

    inertia[[0, 1]] = integrated[7] -
        volume * center_mass[0] * center_mass[1];

    inertia[[1, 2]] = integrated[8] -
        volume * center_mass[1] * center_mass[2];

    inertia[[0, 2]] = integrated[9] -
        volume * center_mass[0] * center_mass[2];

    inertia[[2, 0]] = inertia[[0, 2]];
    inertia[[2, 1]] = inertia[[1, 2]];
    inertia[[1, 0]] = inertia[[0, 1]];
    inertia *= density;

    // println!("{}", center_mass);
    (center_mass, inertia)
}


fn principal_axis(inertia: Array2<f64>) -> (Array1<f64>, Array2<f64>) {
    let negate_nondiagonal: Array2<f64> = &(Array2::eye(3) * 2.0) - 1.0;
    let a: Array2<f64> = inertia * negate_nondiagonal;

    // let m = matrix(vec![a.as_slice().unwrap()], 3, 3, Row);
    // let r: Vec<f64> = a.as_slice().unwrap().to_vec();
    let m = matrix(a.as_slice().unwrap().to_vec(), 3, 3, Row);
    let e = eigen(&m, EigenMethod::Jacobi);
    let (c, v) = e.extract();

    let components =arr1(c.as_slice());
    let vectors: Array2<f64> = ArrayBase::from_shape_vec((3, 3), v.data).unwrap();

    // eigh returns them as column vectors, change them to row vectors
    (components, vectors.reversed_axes())
}


fn transform_arround(matrix: Array2<f64>, point: &Array1<f64>) -> Array2<f64> {
    // def transform_around(matrix, point):
    //     """
    //     Given a transformation matrix, apply its rotation
    //     around a point in space.
    //
    //     Parameters
    //     ----------
    //     matrix: (4,4) or (3, 3) float, transformation matrix
    //     point:  (3,) or (2,)  float, point in space
    //
    //     Returns
    //     ---------
    //     result: (4,4) transformation matrix
    //     """
    //     point = np.asanyarray(point)
    //     matrix = np.asanyarray(matrix)
    //     dim = len(point)
    //     if matrix.shape != (dim + 1,
    //                         dim + 1):
    //         raise ValueError('matrix must be (d+1, d+1)')
    //
    //     translate = np.eye(dim + 1)
    //     translate[:dim, dim] = -point
    //     result = np.dot(matrix, translate)
    //     translate[:dim, dim] = point
    //     result = np.dot(translate, result)
    //
    //     return result

    let mut translate: Array2<f64> = Array2::eye(4);
    translate.slice_mut(s![..3, ..3]).sub_assign(point);

    let mut result = matrix.dot(&translate);
    translate.slice_mut(s![..3, 3]).assign(point);
    result = translate.dot(&result);

    return result

}

pub fn principal_inertia_transform(triangles: VctrTriangles) -> Array2<f64>{
    let (center_mass, inertia) = mass_properties(triangles);
    let (_components, vectors) = principal_axis(inertia);

    // let pic = principal_inertia_axis(inertia)[0];

    // println!("center_mass: {}", center_mass);
    // println!("vectors: {:?}", vectors);
    // println!("_components: {:?}", _components);

    let vcts = vectors;

    // TODO: Reorder vectors by components
    let mut transform = Array2::eye(4);

    // TODO:
    transform.slice_mut(s![..3, ..3]).assign(&vcts);


    // let mut tr = transform_arround(transform, &center_mass);
    transform.slice_mut(s![..3, 3]).sub_assign(&center_mass);

    transform
}


pub fn get_contour(mesh: &Mesh, z_sect: f64) -> Vec<Point2<f64>> {
    // construct plane section
    let mut sect = Vec::<Vec2>::new();

    for vertex_id in mesh.vertex_iter() {
        let p = mesh.vertex_position(vertex_id);
        if (p.z - z_sect).abs() < 0.15 {
            sect.push(Vec2{x: p.x, y: p.y});
        }
    }

    let len = sect.len();
    let mut mt: Vec<Vec<f32>> = Vec::with_capacity(len);
    let mut v: Vec<f32> = Vec::with_capacity(len);
    v.resize(len, 0f32);
    mt.resize(len, v);

    for (i, p) in sect.iter().enumerate() {
        //let v: Vec<f32> = Vec::with_capacity(len);
        // v.resize(len, 0f32);
        //mt.push(v);
        for (j, q) in sect.iter().enumerate() {
            mt[i][j] = p.distance2(*q) as f32;
        }
    }

    let mut ii: Vec<usize> = (0..len).collect();
    for i in 0..len-1 {
        let v = &mt[ ii[ i ] ];
        let j = (i+1..len).min_by_key(|&k| (v[ ii[ k ] ] * 10000.0) as u32).unwrap();
        ii.swap(i + 1, j);
    }

    let mut cntr: Vec<Point2<f64>> = sect
        .iter().enumerate()
        .map(|(i, &_a)| sect[ ii[ i ] ])
        .collect();

    cntr.push(cntr.as_slice()[0]);

    // println!("contour len: {}", sect.len());
    // println!("contour: {:?}", cntr);

    let p0 = *cntr.first().unwrap();
    let pn = *cntr.last().unwrap();
    let d = cntr.first().unwrap().distance(*cntr.last().unwrap()).sqrt();
    let d2 = cntr[0].distance(cntr[1]).sqrt();

    let nn = (d / d2) as i32;
    for n in 0..nn {
        let k = (pn.y - p0.y) / (pn.x - p0.x);

        let p = Point2{x: p0.x + (n as f64)  * d2, y: p0.y + (n as f64) * d2 * k};
        cntr.push(p);
    }

    let ll = cntr.len();
    // println!("{:?}", cntr);
    let e = 0;

    cntr
}
