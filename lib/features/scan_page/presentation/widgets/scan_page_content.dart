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
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    print('try scroll to new obj');
                    try {
                      // await Future<dynamic>.delayed(Duration(seconds: 5));
                      // state.objects.forEach((element) {element.snapshots.forEach((element) {element.isNew });});
                      if (state.hasNew) {
                        final snap = state.firstNew;
                        final gKey = state.globalKeyMap[snap];
                        print(gKey);
                        // final snap = event.object.snapshots.first;
                        Scrollable.ensureVisible(gKey!.currentContext!);
                        print('SCROLL SCROLL');
                      } else {
                        print('No new snapshots');
                      }
                    } catch (e) {
                      print('SCROLL ERROR: $e');
                    }
                  });
                  // try {
                  //   await Future<dynamic>.delayed(Duration(seconds: 5));
                  //   final snap = event.object.snapshots.first;
                  //   Scrollable.ensureVisible(gmap[snap]!.currentContext!);
                  //   print('SCROLL SCROLL');
                  // } catch (e) {
                  //   print('SCROLL ERROR: $e');
                  // }

                  // Map keys
                  return ObjectsList(
                    state: state,
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
