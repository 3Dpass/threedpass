import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';

extension PoolAssetFieldToJS on PoolAssetField {
  Map<String, dynamic> toJSArg() {
    if (isNative) {
      return <String, void>{'Native': null};
    } else {
      return <String, int>{'Asset': assetId!};
    }
  }
}
