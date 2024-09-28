use lzss::{Lzss, SliceReader, VecWriter};
use p3d::p3d_process;
use p3d::AlgoType;

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

pub async fn decompress_obj(obj: &[u8]) -> Vec<u8> {
	type MyLzss = Lzss<10, 4, 0x20, { 1 << 10 }, { 2 << 10 }>;
	let result = MyLzss::decompress(
		SliceReader::new(obj),
		VecWriter::with_capacity(4096),
	);

	result.unwrap()
}

pub async fn calc(input: &[u8], algo_raw: String, par1: i16, par2: i16, trans: Option<[u8; 4]>) -> Vec<String> {
	let algo = match algo_raw.as_str() {
        "Grid2d" => AlgoType::Grid2d,
        "Grid2dV2" => AlgoType::Grid2dV2,
        "Grid2dV3" => AlgoType::Grid2dV3,
        "Grid2dV3a" => AlgoType::Grid2dV3a,
        _=>AlgoType::Grid2d,
    };

	return match p3d_process(input, algo, par1, par2, trans) {
        Ok(h) => h,
        Err(_e) => vec!["Error".to_string()],
    };
}

pub extern fn package_version() -> String {
    return env!("CARGO_PKG_VERSION").to_owned();
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
