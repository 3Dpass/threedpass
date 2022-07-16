import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';

class DeleteSnapshotButton extends StatelessWidget {
  const DeleteSnapshotButton({
    Key? key,
    required this.snapshot,
    required this.hashObject,
  }) : super(key: key);

  final Snapshot snapshot;
  final HashObject? hashObject;

  void deleteSnapshot(BuildContext context) {
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.primaryButton,
      child: Text('delete_snapshot_button'.tr()),
      onPressed: () => deleteSnapshot(context),
    );
  }
}
