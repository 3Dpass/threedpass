// ignore_for_file: prefer-single-widget-per-file, long-parameter-list
part of 'router.dart';

// COPIED FROM GIST
// https://gist.github.com/emri99/74a4da7a18327814fd8a165949da449e

class ModalBottomSheetAutoRoute extends CustomRoute {
  ModalBottomSheetAutoRoute({
    required super.page,
    super.path,
    super.usesPathAsKey,
    super.guards,
    super.fullMatch,
    super.meta,
    super.maintainState,
    super.fullscreenDialog,
    super.children,
    super.title,
    super.restorationId,
    super.keepHistory,
    super.initial,
    super.transitionsBuilder,
    super.durationInMilliseconds,
    super.reverseDurationInMilliseconds,
    super.opaque,
    super.barrierDismissible,
    super.barrierLabel,
    super.barrierColor,
    final double? fixedSize,
    final double initialSize = .5,
    final double minSize = .25,
    final double maxSize = .95,
    final ShapeBorder? shape,
    final bool? isScrollControlled,
    final bool? enableDrag,
    final bool? showDragHandle,
    final Color? backgroundColor,
    final bool? useSafeArea,
    final String? barrierOnTapHint,
  }) : super(
          customRouteBuilder: routeBuilderFactory(
            initialChildSize: fixedSize ?? initialSize,
            maxChildSize: fixedSize ?? maxSize,
            minChildSize: fixedSize ?? minSize,
            barrierColor: barrierColor,
            barrierDismissible: barrierDismissible,
            backgroundColor: backgroundColor,
            barrierLabel: barrierLabel,
            shape: shape,
            isScrollControlled: isScrollControlled,
            enableDrag: enableDrag,
            showDragHandle: showDragHandle,
            useSafeArea: useSafeArea,
            barrierOnTapHint: barrierOnTapHint,
          ),
        );

  static CustomRouteBuilder<dynamic> routeBuilderFactory({
    required final double initialChildSize,
    required final double minChildSize,
    required final double maxChildSize,
    required final bool barrierDismissible,
    final Color? backgroundColor,
    final Color? barrierColor,
    final ShapeBorder? shape,
    final bool? enableDrag,
    final bool? showDragHandle,
    final bool? isScrollControlled,
    final bool? useSafeArea,
    final String? barrierLabel,
    final String? barrierOnTapHint,
  }) {
    return <T>(
      final BuildContext context,
      final Widget child,
      final AutoRoutePage<T> page,
    ) {
      return ModalBottomSheetRoute<T>(
        builder: (final context) {
          return isScrollControlled ?? true
              ? ModalDraggableSheet(
                  child: child,
                  initialChildSize: initialChildSize,
                  minChildSize: minChildSize,
                  maxChildSize: maxChildSize,
                )
              : child;
        },
        barrierLabel: barrierLabel,
        barrierOnTapHint: barrierOnTapHint,
        backgroundColor: backgroundColor,
        shape: shape,
        modalBarrierColor: barrierColor,
        isDismissible: barrierDismissible,
        enableDrag: enableDrag ?? true,
        showDragHandle: showDragHandle,
        isScrollControlled: isScrollControlled ?? true,
        settings: page,
        useSafeArea: useSafeArea ?? false,
      );
    };
  }
}

class ModalDraggableSheet extends StatelessWidget {
  const ModalDraggableSheet({
    required this.child,
    super.key,
    this.initialChildSize = .5,
    this.minChildSize = .25,
    this.maxChildSize = .95,
  });

  final Widget child;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;

  @override
  Widget build(final BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      expand: false,
      builder: (final context, final ScrollController scrollController) =>
          DraggableScrollController(
        child: child,
        scrollController: scrollController,
      ),
    );
  }
}

/// this widget is responsible of supplying the scroll controller of a draggable
/// scrollable sheet to its children.
///
/// * see
///   * [DraggableScrollControllerStateMixin] for stateful widget mixin
///     Use the getter [DraggableScrollControllerStateMixin.scrollController]
///     to get the scroll controller
///   * [DraggableScrollControllerStateMixin] for stateless widget mixin
///     Use the method [DraggableScrollControllerMixin.getScrollController]
///     to get the scroll controller
///
class DraggableScrollController extends InheritedWidget {
  const DraggableScrollController({
    required super.child,
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

  static ScrollController? of(
    final BuildContext context, {
    final bool listen = false,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<DraggableScrollController>()
          ?.scrollController;
    }
    final widget = context
        .getElementForInheritedWidgetOfExactType<DraggableScrollController>()
        ?.widget as DraggableScrollController?;

    return widget?.scrollController;
  }

  @override
  bool updateShouldNotify(covariant final InheritedWidget oldWidget) {
    return false;
  }
}

/// mixin to simplify retrieving the scrollController on stateful widget that may be
/// inserted inside a [ModalDraggableSheet]
mixin DraggableScrollControllerStateMixin<T extends StatefulWidget>
    on State<T> {
  ScrollController? get scrollController =>
      DraggableScrollController.of(context);
}

/// mixin to simplify retrieving the scrollController on stateless widget that may be
/// inserted inside a [ModalDraggableSheet]
mixin DraggableScrollControllerMixin on StatelessWidget {
  ScrollController? getScrollController(final BuildContext context) =>
      DraggableScrollController.of(context);
}
