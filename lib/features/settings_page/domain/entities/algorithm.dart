class AlgorithmMaster {
  // Algo names
  static const grid2d_0_3_0 = 'Grid2d. P3D 0.3.0';
  static const grid2d_0_3_1 = 'Grid2d_v2. P3D 0.3.1';
  static const grid2d_0_3_2 = 'Grid2d_v2. P3D 0.3.2';
  static const grid2d_0_3_3 = 'Grid2d_v3. P3D 0.3.3';

  /// Update this list when a new algorithm is added
  static const list = [
    grid2d_0_3_3,
    grid2d_0_3_2,
    grid2d_0_3_1,
    grid2d_0_3_0,
  ];

  /// Default value for settings
  static const defaultAlgo = grid2d_0_3_3;

  /// Map to rust lib
  /// Must be the same strings as in packages/hash_lib_interface/ffi_interface ...
  static const mapToRust = {
    grid2d_0_3_0: '0.3.0',
    grid2d_0_3_1: '0.3.1',
    grid2d_0_3_2: '0.3.2',
    grid2d_0_3_3: '0.3.3',
  };
}
