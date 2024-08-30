import 'package:threedpass/core/utils/fetch_data_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';

class GetPoscanPropertiesCubit
    extends FetchDataCubit<List<PoscanProperty>, void> {
  GetPoscanPropertiesCubit({
    required super.useCase,
  }) : super(params: null);
}
