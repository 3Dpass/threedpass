// Copied from Quiver package
// https://github.com/google/quiver-dart/blob/d5e5ddc5d4476cc35f3de9afc49925a7140b88a2/lib/src/core/hash.dart#L20
// ignore_for_file: parameter_assignments, prefer_final_parameters, type_annotate_public_apis, inference_failure_on_untyped_parameter

int hash2(a, b) => _finish(_combine(_combine(0, a.hashCode), b.hashCode));

// Jenkins hash functions

int _combine(int hash, int value) {
  hash = 0x1fffffff & (hash + value);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

int _finish(int hash) {
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}
