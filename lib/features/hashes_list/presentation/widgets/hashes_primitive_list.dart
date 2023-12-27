import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/presentation/widgets/hash_primitive_item.dart';

class HashesPrimitiveList extends StatelessWidget {
  const HashesPrimitiveList({
    required this.hashes,
    final Key? key,
  }) : super(key: key);

  final List<String> hashes;

  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      itemCount: hashes.length,
      itemBuilder: (final context, final index) => HashPrimitiveItem(
        hash: '${index + 1}. ${hashes[index]}',
      ),
    );
  }
}
