import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';

class ChooseList extends StatelessWidget {
  const ChooseList({
    Key? key,
    required this.list,
    required this.onChoose,
    required this.chosen,
  }) : super(key: key);

  final List<HashesModel> list;
  final HashesModel chosen;
  final void Function(HashesModel?) onChoose;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<HashesModel>(
      value: chosen,
      items: list
          .map(
            (e) => DropdownMenuItem<HashesModel>(
              value: e,
              child: Text(
                e.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
      onChanged: (modelChosen) => onChoose(modelChosen),
    );
  }
}
