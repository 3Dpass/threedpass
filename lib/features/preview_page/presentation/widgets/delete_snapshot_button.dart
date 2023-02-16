import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class DeleteSnapshotButton extends StatelessWidget {
  const DeleteSnapshotButton({
    required this.snapshot,
    required this.hashObject,
    final Key? key,
  }) : super(key: key);

  final HashObject? hashObject;
  final Snapshot snapshot;

  void deleteSnapshot(final BuildContext context) {
    if (hashObject != null) {
      BlocProvider.of<HashesListBloc>(context).add(
        DeleteHash(
          hash: snapshot,
          object: hashObject!,
        ),
      );
    }
    context.router.pop();
  }

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      // minimumSize: const Size.fromHeight(50),
      text: 'delete_snapshot_button'.tr(),
      onPressed: () => deleteSnapshot(context),
    );
  }
}
