import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanResult extends StatelessWidget {
  const PoscanResult({super.key});

  @override
  Widget build(final BuildContext context) {
    final snap = BlocProvider.of<PreviewPageCubit>(context).state.snapshot;
    return Column(
      children: [
        BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
          builder: (final context, final state) {
            final loadedObject = BlocProvider.of<PoscanObjectsCubit>(context)
                .findObjectByHashes(snap.hashes);
            if (loadedObject != null) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: D3pThemeData.mainColor,
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                  ),
                  onPressed: () => context.router.push(
                    UploadedObjectRoute(uploadedObject: loadedObject),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        BlocBuilder<AppServiceLoaderCubit, AppService>(
          builder: (final context, final state) => Padding16(
            child: D3pElevatedButton(
              text: '3d_rpc_button_label'.tr(),
              onPressed: state.status == AppServiceInitStatus.connected
                  ? () => context.router.push(const D3PRPCRouteWrapper())
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
