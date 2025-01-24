import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ObjectsListHeaderFull extends StatelessWidget {
  const ObjectsListHeaderFull({
    super.key,
  });

  Future<void> refreshObjectsList(final BuildContext context) async {
    final objectsCubit = BlocProvider.of<PoscanObjectsCubit>(context);
    final appServiceCubit = BlocProvider.of<AppServiceLoaderCubit>(context);

    if (appServiceCubit.state.keyring.allAccounts.isNotEmpty) {
      await objectsCubit
          .downloadOwnerObjects(appServiceCubit.state.keyring.current);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'objects_list_header'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        D3pIconButton(
          emptyContraints: true,
          iconData: Icons.refresh,
          onPressed: () async => refreshObjectsList(context),
        ),
      ],
    );
  }
}
