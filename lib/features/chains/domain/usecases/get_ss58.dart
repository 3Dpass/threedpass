import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/usecase.dart';

class GetSS58 extends UseCaseSync<int, void> {
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const GetSS58({required this.appServiceLoaderCubit});

  @override
  int call(void params) =>
      appServiceLoaderCubit.state.networkStateData.ss58Format ??
      ss58formatLive; // TODO make ss58 always not null when get rid of appServiceLoader
}
