import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_item.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanResult extends StatefulWidget {
  const PoscanResult({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PoscanResult> {
  @override
  void initState() {
    super.initState();
    findObj();
  }

  bool isLoaded = false;
  UploadedObject? loadedObject;

  Future<void> findObj() async {
    final snap = BlocProvider.of<PreviewPageCubit>(context).state.snapshot;
    final foundObj = await BlocProvider.of<PoscanObjectsCubit>(context)
        .findObjectByHashes(snap.hashesWithPrefix);

    setState(() {
      isLoaded = true;
      this.loadedObject = foundObj;
    });
  }

  @override
  Widget build(final BuildContext context) {
    if (!isLoaded) {
      return const D3pProgressIndicator(size: 24);
    }

    final snap = BlocProvider.of<PreviewPageCubit>(context).state.snapshot;

    final isSnapNoneTransBytes =
        snap.settingsConfig.transBytesMode == TransBytesMode.none;
    final isCorrectSettings =
        snap.settingsConfig.algorithm == ScanSettings.scanAlgorithm &&
            snap.settingsConfig.gridSize == ScanSettings.scanGridSize &&
            snap.settingsConfig.nSections == ScanSettings.scanNsections &&
            isSnapNoneTransBytes;
    return Column(
      children: [
        const SizedBox(height: 2),
        if (loadedObject != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 2),
            child: ObjectsListItem(
              uploadedObject: loadedObject!,
            ),
          ),
        BlocBuilder<AppServiceLoaderCubit, AppService>(
          builder: (final context, final state) {
            final isNodeConnected =
                state.status == AppServiceInitStatus.connected;
            final isObjectAlreadyApproved = loadedObject != null &&
                loadedObject!.status == UploadedObjectStatus.approved;
            final hasAccount = state.keyring.allAccounts.isNotEmpty;

            final allConditions = isNodeConnected &&
                !isObjectAlreadyApproved &&
                hasAccount &&
                isCorrectSettings;
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
      ],
    );
  }
}
