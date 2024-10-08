import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/file_hash_header.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/snapshots_list.dart';

class ObjectsList extends StatelessWidget {
  const ObjectsList({
    required this.state,
    required this.scrollController,
    final Key? key,
  }) : super(key: key);

  final HashesListState state;
  final ScrollController scrollController;
  // ListObserverController(controller: scrollController);

  @override
  Widget build(final BuildContext context) {
    final objects = state.objects;

    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: objects.length,
      separatorBuilder: (final context, final index) => const H16(),
      itemBuilder: (final context, final objIndex) {
        final currentObject = objects[objIndex];
        final fileHashes = currentObject.fileHashes.toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ObjectTitle(currentObject.name),
            const H4(),
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
      },
    );
  }
}

class _ObjectTitle extends StatelessWidget {
  const _ObjectTitle(this.title);

  final String title;

  @override
  Widget build(final BuildContext context) => Text(
        title,
        style: Theme.of(context).customTextStyles.d3ptitleLarge,
      );
}
