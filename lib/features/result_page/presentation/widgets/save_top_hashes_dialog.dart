import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/widgets/hashes_primitive_list.dart';
import 'package:threedpass/router/router.dart';

class SaveTopHashesDialog extends StatelessWidget {
  const SaveTopHashesDialog({
    Key? key,
    required this.hashObject,
    required this.snapshot,
  }) : super(key: key);

  final HashObject? hashObject;
  final Snapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Top 10 hashes'),
      content: SingleChildScrollView(
        child: HashesPrimitiveList(
          hashesModel: snapshot,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Share'),
          onPressed: () {
            Navigator.of(context).pop();
            Share.share(snapshot.shareText);
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () async {
            // TODO Why it's not possible to place context.router.replace outsite conditional op?
            hashObject != null
                ? context.router.replace(
                    SaveHashDialogRoute(
                      hashesModelToSave: snapshot,
                      hashObject: hashObject!,
                    ),
                  )
                : context.router.replace(
                    SaveObjectDialogRoute(
                      snapshot: snapshot,
                    ),
                  );
          },
        ),
      ],
    );
  }
}
