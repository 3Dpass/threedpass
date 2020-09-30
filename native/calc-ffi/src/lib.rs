//use calc;
#![feature(rustc_private)]

use std::os::raw::{c_char};
use std::ffi::{CString, CStr};


extern crate libc;
use libc::{c_int, size_t};

//extern {
//    fn snappy_compress(input: *const u8,
//                       input_length: size_t,
//                       compressed: *mut u8,
//                       compressed_length: *mut size_t) -> c_int;
//    fn snappy_uncompress(compressed: *const u8,
//                         compressed_length: size_t,
//                         uncompressed: *mut u8,
//                         uncompressed_length: *mut size_t) -> c_int;
//    fn snappy_max_compressed_length(source_length: size_t) -> size_t;
//    fn snappy_uncompressed_length(compressed: *const u8,
//                                  compressed_length: size_t,
//                                  result: *mut size_t) -> c_int;
//    fn snappy_validate_compressed_buffer(compressed: *const u8,
//                                         compressed_length: size_t) -> c_int;
//}

type DartFunc = unsafe extern "C" fn(i64, i64, *const c_char) -> i64;


//fn wrap_progress(pct: i64, status: i64, descr: String, progress: DartFunc) -> u32 {
//    let d = "statu string";
//    let a = unsafe { progress(pct, status, descr) };
//    a
//}


#[no_mangle]
pub extern "C" fn calc(a: i16, b: i16, path: *const c_char, progress: DartFunc) -> *mut c_char  {
    let c_str = unsafe { CStr::from_ptr(path) };

    let fname: &str = match c_str.to_str() {
        Err(_) => "there",
        Ok(string) => string,
    };

    let res: String = p3d::calc(a, b, fname.to_owned(),
        |pct, status, descr| {
            let s = CString::new(descr.as_str()).unwrap().into_raw();
            let a = unsafe { progress(pct, status, s) };
            unsafe { CString::from_raw(s); }
            a
        }
    );

    let s = CString::new(res.as_str()).unwrap().into_raw();

//    let a = unsafe { progress(10, 1, s) };
    s
}

//#[no_mangle]
//pub extern "C" fn calc2(path: &str, b: i64) -> i64 {
//    p3d::calc(a, b)
//}

#[no_mangle]
pub extern fn rust_greeting(to: *const c_char) -> *mut c_char {
    let c_str = unsafe { CStr::from_ptr(to) };
    let recipient = match c_str.to_str() {
        Err(_) => "there",
        Ok(string) => string,
    };



    CString::new("Hello ".to_owned() + recipient).unwrap().into_raw()
}

#[no_mangle]
pub extern fn rust_cstr_free(s: *mut c_char) {
    unsafe {
        if s.is_null() { return }
        CString::from_raw(s)
    };
}