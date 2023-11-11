import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';

class DeleteSnapshotButton extends StatelessWidget {
  const DeleteSnapshotButton({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final PreviewPageCubitState state;

  void deleteSnapshot(final BuildContext context) {
    if (state.hashObject != null) {
      BlocProvider.of<HashesListBloc>(context).add(
        DeleteHash(
          hash: state.snapshot,
          object: state.hashObject!,
        ),
      );
    }
    context.router.pop();
  }

  @override
  Widget build(final BuildContext context) {
    final cardShape = state.psType == PreviewSnapshotType.existingSnapshot
        ? CardShape.bottom
        : CardShape.all;

    return DefaultSettingsButton.openButton(
      iconData: Icons.delete_outline_rounded,
      iconColor: Colors.red,
      textValue: '',
      onPressed: () {},
      text: 'delete_snapshot_button',
      cardShape: cardShape,
    );
    // return D3pElevatedButton(
    //   text: 'delete_snapshot_button'.tr(),
    //   onPressed: () => deleteSnapshot(context),
    // );
  }
}
