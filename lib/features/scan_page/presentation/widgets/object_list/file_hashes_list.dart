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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (final _, final index) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FileHashHeader(fileHash: fileHashes[index]),
                  Flexible(
                      child: SnapshotsList(
                          currentObject: currentObject,
                          allowedFileHash: fileHashes[index]))
                ]);
          },
          separatorBuilder: (final context, final index) => const H4(),
          itemCount: fileHashes.length,
        ),
      ],
    );
  }
}
