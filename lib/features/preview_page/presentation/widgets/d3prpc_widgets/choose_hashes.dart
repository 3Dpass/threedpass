import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_bottom_sheet_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview_page/bloc/d3prpc_cubit.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

class ChooseHashes extends StatelessWidget {
  const ChooseHashes({super.key});

  Future<dynamic> openDialog(
    final BuildContext context,
    final Set<String> sameFileHashes,
  ) {
    // final chosenFromAddresses =
    //     BlocProvider.of<TransferInfoBloc>(context).state.fromAddresses;

    // final accounts = AccountsList(
    //   allAccounts: allAccounts,
    //   chosenAccounts: chosenFromAddresses,
    // ).buildListToChoose();

    return showPlatformModalSheet<dynamic>(
      context: context,
      material: D3pBottonSheetTheme.materialTheme,
      builder: (final _) => Column(
        children: [
          const SizedBoxH24(),
          Flexible(
            child: BlocBuilder<D3PRPCCubit, D3PRPCCubitState>(
              builder: (final context, final state) => ListView.builder(
                shrinkWrap: true,
                itemCount: sameFileHashes.length,
                itemBuilder: (final context, final index) {
                  final hash = sameFileHashes.elementAt(index);
                  return EnumButton(
                    text: hash,
                    isChosen: state.chosenHashes.contains(hash),
                    onPressed: () =>
                        BlocProvider.of<D3PRPCCubit>(context).toggleHash(hash),
                    // child: Text(hash),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;
    final colors = Theme.of(context).customColors;

    // Hashes from all snapshots of the same file
    final sameFileHashes = <String>{};

    final state = BlocProvider.of<PreviewPageCubit>(context).state;
    final currentFileHash = state.snapshot.fileHash;
    final currentObject = state.hashObject;

    if (currentObject != null) {
      final snapshotsSameFileHash = <Snapshot>[];

      // Filter snapshots withe same file hash
      for (final snapshot in currentObject.snapshots) {
        if (snapshot.fileHash == currentFileHash) {
          snapshotsSameFileHash.add(snapshot);
        }
      }

      // Get hashes from same file snapshots
      for (final rightSnapshot in snapshotsSameFileHash) {
        for (final hash in rightSnapshot.hashes) {
          sameFileHashes.add(hash);
        }
      }
    }
    // Anuway add current hashes
    state.snapshot.hashes.forEach((final element) {
      sameFileHashes.add(element);
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBoxH16(),
        const D3pBodyMediumText('d3rpc_subtitle_choose_hashes'),
        const SizedBoxH4(),
        D3pElevatedButton(
          text: null,
          onPressed: () => openDialog(context, sameFileHashes),
          backgroundColor: colors.defaultInputColor,
          elevation: 0,
          childAlignment: MainAxisAlignment.start,
          textStyle: textStyle.d3pBodyMedium,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<D3PRPCCubit, D3PRPCCubitState>(
                builder: (final context, final state) => Text(
                  'x_hashes_chosen'.tr(
                    args: [
                      'HASHES_number_plural'.plural(
                        state.chosenHashes.length,
                      ),
                    ],
                  ),
                  style: textStyle.d3pBodyMedium,
                ),
              ),
              Icon(
                Icons.list,
                color: colors.themeOpposite,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
