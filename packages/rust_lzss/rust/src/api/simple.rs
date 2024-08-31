use lzss::{Lzss, SliceReader, VecWriter};

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

pub fn decompress_obj(obj: &[u8]) -> Vec<u8> {
	type MyLzss = Lzss<10, 4, 0x20, { 1 << 10 }, { 2 << 10 }>;
	let result = MyLzss::decompress(
		SliceReader::new(obj),
		VecWriter::with_capacity(4096),
	);

	result.unwrap()
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
