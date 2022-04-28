import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class HashesPrimitiveList extends StatelessWidget {
  const HashesPrimitiveList({
    Key? key,
    required this.hashesModel,
  }) : super(key: key);

  final Snapshot hashesModel;

  @override
  Widget build(BuildContext context) {
    int len = hashesModel.hashes.length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<Widget>.generate(
        len,
        (int index) {
          return Text(hashesModel.hashes[index]);
        },
      ),
    );
  }
}
