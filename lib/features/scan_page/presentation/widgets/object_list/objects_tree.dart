import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/no_saved_objects_placeholder.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/file_hashes_list.dart';

abstract class MyTreeNode {
  const MyTreeNode({
    required this.title,
    required this.children,
  });

  final String title;
  final List<MyTreeNode> children;

  MyTreeEntryType get type;
}

class RootTreeNode extends MyTreeNode {
  RootTreeNode({required super.title, required super.children});

  @override
  MyTreeEntryType get type => MyTreeEntryType.object;
}

class ChildTreeNode extends MyTreeNode {
  ChildTreeNode({
    required super.title,
    required super.children,
    required this.hashObject,
  });

  final HashObject hashObject;

  @override
  MyTreeEntryType get type => MyTreeEntryType.snapshot;
}

enum MyTreeEntryType { object, snapshot }

class ObjectsTree extends StatelessWidget {
  const ObjectsTree({super.key});

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<HashesListBloc, HashesListState>(
        builder: (final context, final state) {
          if (state.isLoading) {
            return const D3pProgressIndicator(size: null);
          } else {
            final value = state.value!;
            if (value.objects.isEmpty) {
              return const NoSavedObjectsPlaceholder();
            }

            // final objects = value.objects.

            final List<RootTreeNode> roots = value.objects
                .map<RootTreeNode>(
                  (final e) => RootTreeNode(
                    title: e.name,
                    children: [
                      ChildTreeNode(
                        title: '',
                        children: [],
                        hashObject: e,
                      ),
                    ],
                  ),
                )
                .toList();

            final treeController = TreeController<MyTreeNode>(
              roots: roots,
              childrenProvider: (final MyTreeNode node) => node.children,
            );

            return Padding16(
              child: AnimatedTreeView<MyTreeNode>(
                treeController: treeController,
                nodeBuilder: (
                  final BuildContext context,
                  final TreeEntry<MyTreeNode> entry,
                ) {
                  if (entry.node.type == MyTreeEntryType.snapshot) {
                    return TreeIndentation(
                      guide: const IndentGuide.scopingLines(),
                      entry: entry,
                      child: FileHashesList(
                        currentObject: (entry.node as ChildTreeNode).hashObject,
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () => treeController.toggleExpansion(entry.node),
                      child: _ObjectTitle(entry.node.title),
                    );
                  }
                },
              ),
            );
          }
        },
      );
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
