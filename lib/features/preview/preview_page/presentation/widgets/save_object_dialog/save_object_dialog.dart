import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/auto_route_getter.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

part 'widgets/object_name_input.dart';
part 'widgets/snapshot_name_input.dart';

@RoutePage()
class SaveObjectDialog extends StatelessWidget {
  SaveObjectDialog({
    required this.snapshot,
    final Key? key,
  })  : snapshotNameController = TextEditingController(text: snapshot.name),
        super(key: key);

  final objectNameController = TextEditingController();
  final Snapshot snapshot;
  final TextEditingController snapshotNameController;
  final _formKey = GlobalKey<FormState>();

  Future<void> saveObject(final BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final newNamedModel =
          snapshot.copyWith(name: snapshotNameController.text);

      final newObject = HashObject(
        name: objectNameController.text,
        snapshots: [
          newNamedModel,
        ],
      );

      BlocProvider.of<HashesListBloc>(context).add(
        AddObject(
          object: newObject,
        ),
      );

      unawaited(context.rootRouter.maybePop());
    }
  }

  @override
  Widget build(final BuildContext context) {
    return D3pPlatformDialog(
      title: 'create_object_title'.tr(),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _ObjectNameInput(objectNameController),
            const H8(),
            _SnapshotNameInput(snapshotNameController),
          ],
        ),
      ),
      actions: [
        D3pTextButton(
          text: 'Cancel'.tr(),
          onPressed: () async => context.router.maybePop(),
        ),
        D3pTextButton(
          text: 'Save'.tr(),
          onPressed: () async => saveObject(context),
        ),
      ],
    );
  }
}
