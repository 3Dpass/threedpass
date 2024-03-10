use alloc::ffi::CString;
use alloc::string::{ToString, String};

use core::ffi::{c_uchar, c_short, c_char, c_int};

use p3d::p3d_process;
use p3d::AlgoType;


// Interface for the C binding
// @param input - .obj file,
// @param input_len - lenght of bytes array,
// @param par1 - gridSize (for example 8x8),
// @param par2 - nSections (for example 12),
// @param trans - rotation bytes (always 4 bytes hex),
// @param version - algorithm (for example Grid2dV3a),
// @param version_len - length of version string,
// @param send_none - flag to send none as trans bytes
// @param is_debug - return debug string
#[no_mangle]
pub extern fn calc(input: *const c_uchar, input_len: c_int,  par1: c_short, par2: c_short, trans: *const c_uchar, version: *const c_uchar, version_len: c_int, send_none: c_int, is_debug: c_int) -> *mut c_char 
{
    // Some memory leaks are possible 
    // let c_str_path = unsafe { CStr::from_ptr(path) };
    // let rust_str_path = c_str_path.to_str().unwrap().to_string();
    
    let trans2;
    let input2;
    let version2;

    // ¯\_(ツ)_/¯
    unsafe{
        let d = make_slice(trans, 4);
        let d2 =  slice_to_arr4(d);
        let d3 = d2.cloned();
        trans2 = d3;

        let d4 = make_slice(input, input_len as usize); // Cast works ONLY for 64-bit platforms! https://stackoverflow.com/a/50437859/15776812
        input2 = d4;

        version2 = make_slice(version, version_len as usize); // Length of version string
    }

    // println!("Trans: {:?}", trans2);
    // println!("Version: {:?}", version2);

    let u8str = std::str::from_utf8(version2).expect("Invalid UTF-8");
    let algo = match u8str {
        "Grid2d" => AlgoType::Grid2d,
        "Grid2dV2" => AlgoType::Grid2dV2,
        "Grid2dV3" => AlgoType::Grid2dV3,
        "Grid2dV3a" => AlgoType::Grid2dV3a,
        _=>AlgoType::Grid2d,
    };

    let trans = if send_none != 0 { None } else { trans2 };

    if is_debug != 0 {
        let input_let = input_len.to_string();
        let par1_str = par1.to_string();
        let par2_str = par2.to_string();
        let trans_str = match std::str::from_utf8(trans2.unwrap_or_default().as_ref()) {
            Ok(v) => v,
            Err(e) => panic!("Invalid UTF-8 sequence: {}", e),
        }.to_string();
        let version_str = u8str.to_string();
        let version_len_str = version_len.to_string();
        let send_none_str = send_none.to_string();
        let arr = [input_let, par1_str, par2_str, trans_str, version_str, version_len_str, send_none_str];
        return CString::new(arr.join("\n")).unwrap().into_raw();
    }

    let r: Vec<String> = match p3d_process(input2, algo, par1, par2, trans) {
        Ok(h) => h,
        Err(_e) => vec!["Error".to_string()],
    };

    // Maybe we should free the CString. This can be a potential memory leak
    // In the example they call the [free] function 
    // https://github.com/brickpop/flutter-rust-ffi/blob/f7b5d399bab542641b67466c31294b106d57bb9e/rust/src/lib.rs#L16
    return CString::new(r.join("\n")).unwrap().into_raw(); 
}

#[no_mangle]
pub extern fn versionInterface() -> *mut c_char {
    let r = env!("CARGO_PKG_VERSION");

    return CString::new(r).unwrap().into_raw();
}

// OLD TEMPLATE
// pub fn calc_inner_0_3_1(input: &[u8], par1: i16, par2: i16, trans: Option<[u8;4]>)->Result<String, p3d_0_3_1::P3DError>{
//     // let f = File::open(path)?;
//     // let mut input = BufReader::new(f);
//     // let mut buf = Vec::new();

//     // input.read_to_end(&mut buf);

//     // let c: &[u8] = &buf;
    
//     let res_hashes = p3d_0_3_1::p3d_process(input, p3d_0_3_1::AlgoType::Grid2d, par1, par2, trans);

//     let r = match res_hashes {
//         Ok(h) => h,
//         Err(_e) => vec!["Error".to_string()], // Alloc new string
//     };

//     let res = r.join("\n");

//    return Ok(res);
// }

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
