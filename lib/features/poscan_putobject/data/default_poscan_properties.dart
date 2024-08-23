import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';

@Deprecated('Call chain storage to get properties')
final List<PoscanProperty> defaultProperties = [
  PoscanProperty(
    name: 'Non-fungible',
    propValue: PropValue(maxValue: BigInt.one, propIdx: 0),
  ),
  PoscanProperty(
    name: 'Share',
    propValue: PropValue(maxValue: BigInt.from(100000000), propIdx: 1),
  ),
];
