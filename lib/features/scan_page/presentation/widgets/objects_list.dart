import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/file_hash_header.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/snapshots_list.dart';

class ObjectsList extends StatelessWidget {
  const ObjectsList({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final HashesListState state;

  @override
  Widget build(final BuildContext context) {
    if (state is HashesListLoaded) {
      final realState = state as HashesListLoaded;
      final objects = realState.objects;

      return ListView.builder(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: objects.length,
        itemBuilder: (final context, final objIndex) {
          final currentObject = objects[objIndex];
          final fileHashes = currentObject.fileHashes.toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _ObjectTitle(currentObject.name),
              const SizedBoxH4(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: fileHashes.length,
                itemBuilder: (final _, final index) {
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
        },
      );
    }
    return const SizedBox();
  }
}

class _ObjectTitle extends StatelessWidget {
  const _ObjectTitle(this.title);

  final String title;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16, right: 16),
        child: Text(
          title,
          style: Theme.of(context).customTextStyles.d3ptitleLarge,
        ),
      );
}
