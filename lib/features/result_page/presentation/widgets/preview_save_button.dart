import 'package:flutter/material.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/router/router.dart';

class PreviewSaveButton extends StatelessWidget {
  const PreviewSaveButton({
    Key? key,
    required this.snapshot,
    required this.hashObject,
  }) : super(key: key);

  final HashObject? hashObject;
  final Snapshot snapshot;

  String get entity {
    return hashObject != null ? 'snapshot' : 'object';
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.primaryButton,
      child: Text('Save this $entity'),
      onPressed: () async {
        hashObject != null
            ? SaveHashDialogRoute(
                hashesModelToSave: snapshot,
                hashObject: hashObject!,
              ).show(context)
            : SaveObjectDialogRoute(
                snapshot: snapshot,
              ).show(context);
      },
    );
  }
}
