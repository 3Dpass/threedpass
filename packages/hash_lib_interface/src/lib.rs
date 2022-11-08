extern crate p3d;
use crate::p3d::{p3d_process, AlgoType, P3DError};

#[macro_use]
extern crate alloc;

mod ffi_interface;

// fn main(){
//     let res = ffi_interface::calc_inner("./3dpass-1308.obj".to_string(), 6, 6, Some([1 as u8,2 as u8,3 as u8,4 as u8]));
//     // let res = ffi_interface::calc_inner(6, 6, "./pir1 3.obj".to_string());
//     let r = match res {
//         Ok(h) => println!("{}", h),
//         Err(_e) => println!("error"),
//     };
//     // println!("Hello, world!");
// }