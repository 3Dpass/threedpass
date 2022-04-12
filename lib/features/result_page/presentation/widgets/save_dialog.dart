import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/result_page/presentation/pages/result_page.dart';

class SaveDialog extends StatelessWidget {
  SaveDialog({
    required this.hashesModelToSave,
  });

  final controller = TextEditingController();
  final HashesModel hashesModelToSave;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // title: Text('Save hashes'),
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

                      final newNamedModel = hashesModelToSave.copyWith(
                          name: value, externalPathToObj: null);

                      BlocProvider.of<HashesListBloc>(context).add(
                        SaveNewHash(
                          model: newNamedModel,
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResultPage(
                            hashesModel: newNamedModel,
                          ),
                        ),
                      );
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
