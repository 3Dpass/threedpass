import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollview_observer/scrollview_observer.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/no_saved_objects_placeholder.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list.dart';

/// This allows a value of type T or T?
/// to be treated as a value of type T?.
///
/// We use this so that APIs that have become
/// non-nullable can still be used with `!` and `?`
/// to support older versions of the API as well.
T? ambiguate<T>(final T? value) => value;

// FROM https://github.com/fluttercandies/flutter_scrollview_observer/blob/main/example/lib/features/listview/listview_demo/listview_demo_page.dart
class ScrollableObjectsList extends StatefulWidget {
  const ScrollableObjectsList({final Key? key}) : super(key: key);

  @override
  State<ScrollableObjectsList> createState() => _ScrollableObjectsListState();
}

class _ScrollableObjectsListState extends State<ScrollableObjectsList> {
  ScrollController scrollController = ScrollController();

  late ListObserverController observerController;

  @override
  void initState() {
    super.initState();

    observerController = ListObserverController(controller: scrollController);

    // Trigger an observation manually
    ambiguate(WidgetsBinding.instance)?.endOfFrame.then(
      (final _) {
        // After layout
        if (mounted) {
          observerController.dispatchOnceObserve();
        }
      },
    );
  }

  @override
  void dispose() {
    observerController.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HashesListBloc, HashesListState>(
      builder: (final context, final state) {
        if (state is HashesListLoaded) {
          if (state.objects.isEmpty) {
            return const NoSavedObjectsPlaceholder();
          } else {
            if (state.requiresScroll) {
              WidgetsBinding.instance.addPostFrameCallback((final _) {
                logger.d('try scroll to new obj');

                // TODO Remove try-catch and detect if scrool is needed
                try {
                  final obj = state.objects.firstWhere(
                    (final element) =>
                        element.snapshots.any((final element) => element.isNew),
                  );
                  final index = state.objects.indexOf(obj);

                  // TODO Scroll with padding to snapshot. Fix for miltiple local file hashes
                  // Make file hashes scroll instead of objects. Set object headers as separators and scroll to the end of the file item
                  observerController.animateTo(
                    index: index,
                    // padding: EdgeInsets.only(bottom: 300),
                    // alignment: 200,
                    alignment: 1,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.linear,
                  );
                  logger.d('SCROLL SCROLL');
                } on Object catch (_) {
                  logger.d('NO SCROLL');
                }
              });
            }

            return ListViewObserver(
              autoTriggerObserveTypes: const [
                ObserverAutoTriggerObserveType.scrollEnd,
              ],
              triggerOnObserveType: ObserverTriggerOnObserveType.directly,
              controller: observerController,
              child: ObjectsList(
                state: state,
                scrollController: scrollController,
              ),
            );
          }
        } else {
          return const D3pProgressIndicator(size: null);
        }
      },
    );
  }
}
