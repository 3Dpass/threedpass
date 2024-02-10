import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/floating_action_button/delete_snapshots_button.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/floating_action_button/get_object_from_file_button.dart';

class ScanPageFloatinActionButton extends StatelessWidget {
  const ScanPageFloatinActionButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SelectSnapshotsCubit, SelectSnapshotsState>(
      buildWhen: (final previous, final current) =>
          previous.areSelectable != current.areSelectable,
      builder: (final _, final state) => state.areSelectable
          ? const DeleteSnaphotsButton()
          : const GetObjectFromFileFloatingButton(),
    );
  }
}
