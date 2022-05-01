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

  final Snapshot snapshot;
  final HashObject? hashObject;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.primaryButton,
      child: const Text('Save this object'),
      onPressed: () async {
        // showDialog(
        //   context: context,
        //   barrierDismissible: false, // user must tap button!
        //   builder: (BuildContext context) => hashObject != null
        //       ? SaveHashDialog(
        //           hashesModelToSave: snapshot,
        //           hashObject: hashObject!,
        //         )
        //       : SaveObjectDialog(
        //           snapshot: snapshot,
        //         ),
        // );

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
