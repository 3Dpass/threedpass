class PoscanCategories {
  final String catName;
  final List<String> subCats;

  const PoscanCategories._(this.catName, this.subCats);

  static final MapPoscanCategory first = MapPoscanCategory(
    cat: allCats.first.catName,
    subCat: allCats.first.subCats.first,
  );

  static const List<PoscanCategories> allCats = [
    objects3d,
    // drawings2d,
    // music,
    // biometrics,
    // movements,
  ];

  static const PoscanCategories objects3d = const PoscanCategories._(
    'objects3d',
    ['grid2dLow'], // 'grid2dHigh'
  );
  static const PoscanCategories drawings2d =
      const PoscanCategories._('drawings2d', []);
  static const PoscanCategories music = const PoscanCategories._('music', []);
  static const PoscanCategories biometrics =
      const PoscanCategories._('biometrics', []);
  static const PoscanCategories movements =
      const PoscanCategories._('movements', []);
}

class MapPoscanCategory {
  const MapPoscanCategory({
    required this.cat,
    required this.subCat,
  });

  final String cat;
  final String subCat;

  Map<String, String> build() {
    return {cat: subCat};
  }
}
