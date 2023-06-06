class AlgorithmMaster {
  // Algo names
  static const grid2d_0_3_3_v1 = 'Grid2d. P3D 0.3.3';
  static const grid2d_0_3_3_v2 = 'Grid2d_v2. P3D 0.3.3';
  static const grid2d_0_3_3_v3 = 'Grid2d_v3. P3D 0.3.3';

  /// Update this list when a new algorithm is added
  static const list = [
    grid2d_0_3_3_v1,
    grid2d_0_3_3_v2,
    grid2d_0_3_3_v3,
  ];

  /// Default value for settings
  static const defaultAlgo = grid2d_0_3_3_v1;

  /// Map to rust lib
  /// Must be the same strings as in packages/hash_lib_interface/ffi_interface ...
  /// Lengths should be the same as declared in ffi_interface
  static const mapToRust = {
    grid2d_0_3_3_v1: '0.3.3_Grid2d_v1',
    grid2d_0_3_3_v2: '0.3.3_Grid2d_v2',
    grid2d_0_3_3_v3: '0.3.3_Grid2d_v3',
  };
}
