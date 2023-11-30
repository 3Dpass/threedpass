import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_putobject/bloc/d3prpc_cubit.dart';
import 'package:threedpass/features/poscan_putobject/presentation/d3prpc_widgets/open_bottom_sheet.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

class ChooseHashes extends StatelessWidget {
  const ChooseHashes({super.key});

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;

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
    sameFileHashes.remove('');

    return OpenBottomSheet(
      unlocalizedSubtitle: 'poscan_putobject_choose_hashes',
      bottomSheetPlatform: BlocBuilder<D3PRPCCubit, D3PRPCCubitState>(
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
            );
          },
        ),
      ),
      buttonIconData: Icons.list,
      buttonTextChild: BlocBuilder<D3PRPCCubit, D3PRPCCubitState>(
        buildWhen: (final previous, final current) =>
            previous.chosenHashes != current.chosenHashes,
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
    );
  }
}
