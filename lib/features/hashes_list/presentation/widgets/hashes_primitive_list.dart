import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/widgets/hash_primitive_item.dart';

class HashesPrimitiveList extends StatelessWidget {
  const HashesPrimitiveList({
    required this.hashesModel,
    final Key? key,
  }) : super(key: key);

  final Snapshot hashesModel;

  @override
  Widget build(final BuildContext context) {
    final int len = hashesModel.hashes.length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<Widget>.generate(
        len,
        (final int index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: HashPrimitiveItem(
            hash: hashesModel.hashes[index],
          ),
        ),
      ),
    );
  }
}
