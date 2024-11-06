import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/no_saved_objects_placeholder.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/expansion_panel_objects_list.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/scan_indicator.dart';

class ScanPageContent extends StatelessWidget {
  const ScanPageContent({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        const ScanIndicator(),
        Flexible(
          child: BlocBuilder<HashesListBloc, HashesListState>(
            builder: (final context, final state) {
              if (state.isLoading) {
                return const D3pProgressIndicator(size: null);
              } else {
                final value = state.value!;
                if (value.objects.isEmpty) {
                  return const NoSavedObjectsPlaceholder();
                }

                return ExpansionPanelObjectsList(objects: value.objects);
              }
            },
          ),
        ),
      ],
    );
  }
}
