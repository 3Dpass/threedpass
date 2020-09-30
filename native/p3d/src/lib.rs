#![feature(deque_make_contiguous)]

use std::fs::File;
use std::io::{ BufReader };
use std::path::PathBuf;

use obj::{load_obj, Obj, Vertex};
use tri_mesh::prelude::*;

#[macro_use(s)]
extern crate ndarray;

//extern crate ndarray_linalg;
//extern crate openblas_src; // or another backend of your choice

use ndarray::arr2;
use ndarray::Array3;
use crate::algo_grid::get_contour;

mod polyline;
mod contour;
mod algo_grid;
use algo_grid::find_top_std;
use crate::contour::Cntr;
//use std::intrinsics::log10f32;
type Vec2 = Point2<f64>;


#[derive(Debug)]
pub enum AlgoType {
    Grid2d,
    Spectr,
}

// type ProgressFunc = |pct: i64, status: i64, descr: String| -> u32;

pub fn calc<F>(par1: i16, par2: i16, path: String, fptr: F) -> String
    where F: Fn(i64, i64, String) -> i64
{
    // a.wrapping_add(b)
    //let path = PathBuf::from(r"assets/st1.obj");
    let p = PathBuf::from(path.clone());
//     dbg!("rust: {:?}", p.clone());

    // path + "-res"

    let res_hashes = p3d_process(&p, AlgoType::Grid2d, par1, par2, Some(fptr));
    // println!("{:?}", res_hashes);
    let r = match res_hashes {
        Ok(h) => h,
        Err(e) => vec![format!("{:?}", e)],
    };

    //format!("{}", r)
    r.join("\n")
}


#[allow(unused_variables)]
pub fn p3d_process<F>(scan_name: &PathBuf, algo: AlgoType, par1: i16, par2: i16, fptr: Option<F>) -> Result<Vec<String>, std::io::Error>
    where F: Fn(i64, i64, String) -> i64
//pub fn p3d_process(scan_name: &PathBuf, algo: AlgoType, par1: i16, par2: i16 ) -> Result<Vec<String>, std::io::Error>
{
    let grid_size: i16 = par1;
    let n_sections: i16 = par2;

    // let a = fptr(15, 1, "Start".to_owned());

    // use crate::algo_grid::mass_properties;
    // let triangles: Array3<f64> = arr3(
    //     &[
    //         [[1.,2.,3.], [1.,2.,3.], [1.,2.,3.]],
    //         [[1.,2.,3.], [1.,2.,3.], [1.,2.,3.]],
    //         [[1.,2.,3.], [1.,2.,3.], [1.,2.,3.]],
    //         [[1.,2.,3.], [1.,2.,3.], [1.,2.,3.]],
    //         [[1.,2.,3.], [1.,2.,3.], [1.,2.,3.]],
    //         [[1.,2.,3.], [1.,2.,3.], [1.,2.,3.]],
    //     ]);

    //let res = mass_properties(triangles);

    // let result = std::fs::read_to_string(&args.infile);
    //
    // let content = match result {
    //     Ok(content) => { content },
    //     Err(error) => { return Err(error.into());  }
    // };
    // println!("file content: {}", content);

    // let mut mesh = MeshBuilder::new().with_obj(scan_name.clone().into_os_string().into_string().unwrap()).build().unwrap();

    //let _input = File::open(scan_name)?;
    // let input = BufReader::new(input);

    let input = BufReader::new(File::open(scan_name)?);
    let model: Obj<Vertex, u32> = load_obj(input).unwrap();

    let verts = model.vertices
        .iter()
        .flat_map(|v| v.position.iter())
        .map(|v| f64::from(*v))
        .collect();

    let mut mesh = MeshBuilder::new()
        .with_indices(model.indices)
        .with_positions(verts)
        .build().unwrap();

    let mut triangles: Array3<f64> = Array3::zeros((mesh.no_faces(), 3, 3));

    for (i, fid) in mesh.face_iter().enumerate() {
        let vs = mesh.face_vertices(fid);
        let v1 = mesh.vertex_position(vs.0);
        let v2 = mesh.vertex_position(vs.1);
        let v3 = mesh.vertex_position(vs.2);
        triangles.slice_mut(s![i, .., ..])
            .assign(
            &arr2(&[
                    [v1.x as f64, v1.y as f64, v1.z as f64],
                    [v2.x as f64, v2.y as f64, v2.z as f64],
                    [v3.x as f64, v3.y as f64, v3.z as f64],
                ]
            ));
    }

    let pit1 = algo_grid::principal_inertia_transform(triangles);

    // println!("Transform matrix:");
    // println!("{}", pit1);

    let pit = pit1; //.t();

    let a: Matrix4<f64> = Matrix4::new(
        pit[[0,0]], pit[[0,1]], pit[[0,2]], pit[[0,3]],
        pit[[1,0]], pit[[1,1]], pit[[1,2]], pit[[1,3]],
        pit[[2,0]], pit[[2,1]], pit[[2,2]], pit[[2,3]],
        pit[[3,0]], pit[[3,1]], pit[[3,2]], pit[[3,3]],
    ); //.transpose();

    let a: Matrix3<f64> = Matrix3::new(
        pit[[0,0]], pit[[0,1]], pit[[0,2]],
        pit[[1,0]], pit[[1,1]], pit[[1,2]],
        pit[[2,0]], pit[[2,1]], pit[[2,2]],
    ); //.transpose();

    let b = a.invert().unwrap();

    let tr: Matrix4<f64> = Matrix4::new(
        b.x[0], b.x[1], b.x[2], 0.0,
        b.y[0], b.y[1], b.y[2], 0.0,
        b.z[0], b.z[1], b.z[2], 0.0,
        0.0, 0.0, 0.0, 1.0
    ); //.transpose();

    let shift = Vector3::new(pit[[0,3]], pit[[1,3]], pit[[2,3]]);


    // let m: Matrix4<f64> = Matrix4::new(
    //     bbb.x[0], bbb.y[0], bbb.z[0], pit[[0,3]],
    //     bbb.x[1], bbb.y[1], bbb.z[1], pit[[1,3]],
    //     bbb.x[2], bbb.y[2], bbb.z[2], pit[[2,3]],
    //     pit[[3,0]], pit[[3,1]], pit[[3,2]], pit[[3,3]],
    //     );

    // let m: Matrix4<f64> = Matrix4::new(
    //     bbb.x[0], bbb.y[0], bbb.z[0], pit[[3, 0]],
    //     bbb.x[1], bbb.y[1], bbb.z[1], pit[[3, 1]],
    //     bbb.x[2], bbb.y[2], bbb.z[2], pit[[3, 2]],
    //     pit[[0,3]], pit[[1,3]], pit[[2,3]], pit[[3,3]],
    // );

    // semi good
    // let m: Matrix4<f64> = Matrix4::new(
    //     bbb.x[0], bbb.y[0], bbb.z[0], pit[[3, 0]],
    //     bbb.x[1], bbb.y[1], bbb.z[1], pit[[3, 1]],
    //     bbb.x[2], bbb.y[2], bbb.z[2], pit[[3, 2]],
    //     pit[[0,3]], pit[[1,3]], pit[[2,3]], pit[[3,3]],
    // );


    // let m: Matrix4<f64> = Matrix4::new(
    //      1.0, 0.0, 0.0,0.0,
    //      0.0, 1.0, 0.0,50.0,
    //      0.0, 0.0, 1.0,0.0,
    //      0.0, 0.0, 0.0,1.0,
    //      );

    // let m: Matrix4<f64> = Matrix4::new(
    //     bbb.x[0], bbb.y[0], bbb.z[0], 60.0,
    //     bbb.x[1], bbb.y[1], bbb.z[1], 0.0,
    //     bbb.x[2], bbb.y[2], bbb.z[2], 0.0,
    //     0.0, 0.0, 0.0, 1.0,
    // );


    //let mm = m.transpose();
    //println!("{:?}", tr);

    mesh.translate(shift);
    mesh.apply_transformation(tr);


    // let p = Vec3::new(0.0, 0.0, 0.0);
    // let p_new = (mm * p.extend(1.0)).truncate();

    //
    // let obj_source = mesh.parse_as_obj();
    // // // //
    // // // // Write the string to an .obj file
    // std::fs::write("foo.obj", obj_source)?;

    let (mut mi, mut ma) = (1.0e10, -1.0e10);

    for vid in mesh.vertex_iter() {
        let v = mesh.vertex_position(vid);
        if v.z < mi {
            mi = v.z;
        }
        if v.z > ma {
            ma = v.z;
        }
    }

    // let z_sect = (ma + mi) / 2.0;
    // let depth: i32 = (10.0 * (10.0 / (1.0f64 + n_sections as f64)).log10()).floor() as i32;
    // let mut results: Vec<Vec<String>> = Vec::with_capacity(depth.pow(n_sections as u32) as usize);

    let depth = 10;
    let mut cntrs: Vec<Vec<Vec2>> = Vec::with_capacity(depth);
    println!("Select top {} hashes", depth);
    let step = (ma - mi) / (1.0f64 + n_sections as f64);
    for n in 0..n_sections {
        let z_sect = mi + (n as f64 + 1.0f64) * step;
        let cntr = get_contour(&mesh, z_sect);
        cntrs.push(cntr);
    }

    let res = find_top_std(depth as usize, grid_size, &cntrs);

    Ok(res)
}
