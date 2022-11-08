use alloc::ffi::CString;
use alloc::string::{ToString, String};

use crate::{p3d_process, AlgoType, P3DError};
use core::ffi::{c_uchar, c_short, c_char, c_int};



// Interface for the C binding
#[no_mangle]
pub extern fn calc(input: *const c_uchar, input_len: c_int,  par1: c_short, par2: c_short, trans: *const c_uchar) -> *mut c_char 
{
    // Some memory leaks are possible 
    // let c_str_path = unsafe { CStr::from_ptr(path) };
    // let rust_str_path = c_str_path.to_str().unwrap().to_string();
    
    let trans2;
    let input2;

    // ¯\_(ツ)_/¯
    unsafe{
        let d = make_slice(trans, 4);
        let d2 =  slice_to_arr4(d);
        let d3 = d2.cloned();
        trans2 = d3;

        let d4 = make_slice(input, input_len as usize); // Cast works ONLY for 64-bit platforms! https://stackoverflow.com/a/50437859/15776812
        input2 = d4;
    }

    let r = match calc_inner(input2, par1, par2, trans2) {
        Ok(h) => h,
        Err(_e) => "Error".to_string(),
    };

    // Maybe we should free the CString. This can be a potential memory leak
    // In the example they call the [free] function 
    // https://github.com/brickpop/flutter-rust-ffi/blob/f7b5d399bab542641b67466c31294b106d57bb9e/rust/src/lib.rs#L16
    return CString::new(r).unwrap().into_raw(); 
}

#[no_mangle]
pub extern fn version() -> *mut c_char {
    let r = env!("CARGO_PKG_VERSION");

    return CString::new(r).unwrap().into_raw();
}

pub fn calc_inner(input: &[u8], par1: i16, par2: i16, trans: Option<[u8;4]>)->Result<String, P3DError>{
    // let f = File::open(path)?;
    // let mut input = BufReader::new(f);
    // let mut buf = Vec::new();

    // input.read_to_end(&mut buf);

    // let c: &[u8] = &buf;
    
    let res_hashes = p3d_process(input, AlgoType::Grid2d, par1, par2, trans);

    let r = match res_hashes {
        Ok(h) => h,
        Err(_e) => vec!["Error".to_string()], // Alloc new string
    };

    let res = r.join("\n");

   return Ok(res);
}

// https://stackoverflow.com/a/48129731/15776812
fn slice_to_arr4<T>(slice: &[T]) -> Option<&[T; 4]> {
    if slice.len() == 4 {
        Some(unsafe { &*(slice as *const [T] as *const [T; 4]) })
    } else {
        None
    }
}

// https://stackoverflow.com/a/50942268/15776812
unsafe fn make_slice<'a>(ptr: *const u8, len: usize) -> &'a [u8] {
    // place pointer address and length in contiguous memory
    let x: [usize; 2] = [ptr as usize, len];

    // cast pointer to array as pointer to slice
    let slice_ptr = &x as * const _ as *const &[u8];

    // dereference pointer to slice, so we get a slice
    *slice_ptr
}
