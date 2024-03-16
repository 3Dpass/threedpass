import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_item.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanResult extends StatelessWidget {
  const PoscanResult({super.key});

  @override
  Widget build(final BuildContext context) {
    final snap = BlocProvider.of<PreviewPageCubit>(context).state.snapshot;
    final loadedObject = BlocProvider.of<PoscanObjectsCubit>(context)
        .findObjectByHashes(snap.hashes);

    final isSnapNoneTransBytes =
        snap.settingsConfig.transBytesMode == TransBytesMode.none;
    return Column(
      children: [
        const SizedBox(height: 2),
        if (loadedObject != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 2),
            child: ObjectsListItem(
              uploadedObject: loadedObject,
            ),
          ),
        BlocBuilder<AppServiceLoaderCubit, AppService>(
          builder: (final context, final state) {
            final isNodeConnected =
                state.status == AppServiceInitStatus.connected;
            final isObjectAlreadyApproved = loadedObject != null &&
                loadedObject.status.toLowerCase() == 'approved';

            final allConditions = isNodeConnected &&
                !isObjectAlreadyApproved &&
                isSnapNoneTransBytes;
            return Padding16(
              child: D3pElevatedButton(
                iconData: Icons.upload,
                text: '3d_rpc_button_label'.tr(),
                onPressed: allConditions
                    ? () => context.router.push(const D3PRPCRouteWrapper())
                    : null,
              ),
            );
          },
        ),
        _PutObjectHelp(isSnapNoneTransBytes),
      ],
    );
  }
}

class _PutObjectHelp extends StatelessWidget {
  final bool isSnapNoneTransBytes;

  const _PutObjectHelp(this.isSnapNoneTransBytes);

  @override
  Widget build(final BuildContext context) {
    if (isSnapNoneTransBytes) {
      return const SizedBox();
    } else {
      return const Padding(
        padding: EdgeInsets.only(top: 2),
        child: D3pBodyMediumText('trans_bytes_mode_help'),
      );
    }
  }
}
