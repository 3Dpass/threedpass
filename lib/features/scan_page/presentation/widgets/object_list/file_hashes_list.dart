import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/file_hash_header.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/snapshots_list.dart';

class FileHashesList extends StatelessWidget {
  final HashObject currentObject;

  const FileHashesList({
    required this.currentObject,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final fileHashes = currentObject.fileHashes.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // _ObjectTitle(currentObject.name),
        // const H4(),
        ListView.separated(
          // primary: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: fileHashes.length,
          separatorBuilder: (final context, final index) => const H4(),
          itemBuilder: (final _, final index) {
            // children: List.generate(
            //   fileHashes.length,
            //   (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FileHashHeader(
                  fileHash: fileHashes[index],
                ),
                Flexible(
                  child: SnapshotsList(
                    currentObject: currentObject,
                    allowedFileHash: fileHashes[index],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
