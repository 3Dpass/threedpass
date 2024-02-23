import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/bloc/snapshots_has_new_extension.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/no_saved_objects_placeholder.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list.dart';
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
              if (state is HashesListLoaded) {
                if (state.objects.isEmpty) {
                  return const NoSavedObjectsPlaceholder();
                } else {
                  if (state.requiresScroll) {
                    // TODO. IF PERFOMANCE IS POOR. REWRITE THIS USING LISTVIEW.BUILDER AND MANUAL OFFSET SCROLL
                    WidgetsBinding.instance.addPostFrameCallback((final _) {
                      debugPrint('try scroll to new obj');
                      try {
                        // await Future<dynamic>.delayed(Duration(seconds: 5));
                        // state.objects.forEach((element) {element.snapshots.forEach((element) {element.isNew });});
                        if (state.hasNew) {
                          final snap = state.firstNew;
                          final gKey = state.globalKeyMap[snap];
                          // final snap = event.object.snapshots.first;
                          Scrollable.ensureVisible(
                            gKey!.currentContext!,
                            duration: Duration(seconds: 1),
                          );
                          debugPrint('SCROLL SCROLL');
                        } else {
                          debugPrint('No new snapshots');
                        }
                      } on Object catch (e) {
                        debugPrint('SCROLL ERROR: $e');
                      }
                    });
                  }

                  // Map keys
                  return SingleChildScrollView(
                    child: ObjectsList(
                      state: state,
                    ),
                  );
                }
              } else {
                return Center(
                  child: PlatformCircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
