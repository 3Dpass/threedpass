import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
      title: Text('top_10_hashes'.tr()),
      content: SingleChildScrollView(
        child: HashesPrimitiveList(
          hashesModel: snapshot,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'.tr()),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Share'.tr()),
          onPressed: () {
            Navigator.of(context).pop();
            Share.share(snapshot.shareText);
          },
        ),
        TextButton(
          child: Text('Save'.tr()),
          onPressed: () async {
            // TODO Why it's not possible to place context.router.replace outsite conditional op?
            hashObject != null
                ? context.router.replace(
                    SaveHashDialogRoute(
                      snapshot: snapshot,
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
