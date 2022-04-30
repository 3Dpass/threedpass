import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/result_page/presentation/pages/preview_page.dart';
import 'package:threedpass/router/router.gr.dart';

class SaveHashDialog extends StatelessWidget {
  SaveHashDialog({
    Key? key,
    required this.hashesModelToSave,
    required this.hashObject,
  }):super(key: key);

  final controller = TextEditingController();
  final Snapshot hashesModelToSave;
  final HashObject hashObject;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: <Widget>[
              Text(
                'Save top hashes as',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: TextField(
                  decoration: InputDecoration(
                    isCollapsed: false,
                  ),
                  controller: controller,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      String value = controller.text;

                      final newNamedModel =
                          hashesModelToSave.copyWith(name: value);

                      BlocProvider.of<HashesListBloc>(context).add(
                        SaveNewHash(
                          model: newNamedModel,
                        ),
                      );
                      
                      context.router.replace(PreviewRoute(hashObject: hashObject, snapshot: snapshot))
                     
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
