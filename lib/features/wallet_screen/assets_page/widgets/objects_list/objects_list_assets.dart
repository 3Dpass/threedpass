import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list.dart';

class ObjectsListAssets extends StatelessWidget {
  const ObjectsListAssets({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final appService) => UploadedObjectsList(
        showHeader: true,
        filter: (final obj) => obj.owner == appService.keyring.current.address,
      ),
    );
  }
}
