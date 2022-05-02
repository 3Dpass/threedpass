// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    PreviewPageWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewPageWrapperRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PreviewPageWrapper(
              key: args.key,
              hashObject: args.hashObject,
              snapshot: args.snapshot));
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: SettingsPage());
    },
    CalcHashLoadingWidgetRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const CalcHashLoadingWidget(),
          customRouteBuilder: dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    PreviewPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewPage());
    },
    CompareRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<CompareRouteWrapperArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ComparePageWrapper(
              key: args.key,
              origObj: args.origObj,
              hashObject: args.hashObject));
    },
    SaveObjectDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveObjectDialogRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SaveObjectDialog(key: args.key, snapshot: args.snapshot),
          customRouteBuilder: dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SaveHashDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveHashDialogRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SaveHashDialog(
              key: args.key,
              hashesModelToSave: args.hashesModelToSave,
              hashObject: args.hashObject),
          customRouteBuilder: dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(PreviewPageWrapperRoute.name,
            path: '/preview-page-wrapper',
            children: [
              RouteConfig(PreviewPageRoute.name,
                  path: '', parent: PreviewPageWrapperRoute.name),
              RouteConfig(CompareRouteWrapper.name,
                  path: 'compare-page-wrapper',
                  parent: PreviewPageWrapperRoute.name),
              RouteConfig(SaveObjectDialogRoute.name,
                  path: 'save-object-dialog',
                  parent: PreviewPageWrapperRoute.name),
              RouteConfig(SaveHashDialogRoute.name,
                  path: 'save-hash-dialog',
                  parent: PreviewPageWrapperRoute.name)
            ]),
        RouteConfig(SettingsRoute.name, path: '/settings-page'),
        RouteConfig(CalcHashLoadingWidgetRoute.name,
            path: '/calc-hash-loading-widget')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [PreviewPageWrapper]
class PreviewPageWrapperRoute
    extends PageRouteInfo<PreviewPageWrapperRouteArgs> {
  PreviewPageWrapperRoute(
      {Key? key,
      required HashObject? hashObject,
      required Snapshot snapshot,
      List<PageRouteInfo>? children})
      : super(PreviewPageWrapperRoute.name,
            path: '/preview-page-wrapper',
            args: PreviewPageWrapperRouteArgs(
                key: key, hashObject: hashObject, snapshot: snapshot),
            initialChildren: children);

  static const String name = 'PreviewPageWrapperRoute';
}

class PreviewPageWrapperRouteArgs {
  const PreviewPageWrapperRouteArgs(
      {this.key, required this.hashObject, required this.snapshot});

  final Key? key;

  final HashObject? hashObject;

  final Snapshot snapshot;

  @override
  String toString() {
    return 'PreviewPageWrapperRouteArgs{key: $key, hashObject: $hashObject, snapshot: $snapshot}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [CalcHashLoadingWidget]
class CalcHashLoadingWidgetRoute extends PageRouteInfo<void> {
  const CalcHashLoadingWidgetRoute()
      : super(CalcHashLoadingWidgetRoute.name,
            path: '/calc-hash-loading-widget');

  static const String name = 'CalcHashLoadingWidgetRoute';
}

/// generated route for
/// [PreviewPage]
class PreviewPageRoute extends PageRouteInfo<void> {
  const PreviewPageRoute() : super(PreviewPageRoute.name, path: '');

  static const String name = 'PreviewPageRoute';
}

/// generated route for
/// [ComparePageWrapper]
class CompareRouteWrapper extends PageRouteInfo<CompareRouteWrapperArgs> {
  CompareRouteWrapper(
      {Key? key, required Snapshot origObj, required HashObject hashObject})
      : super(CompareRouteWrapper.name,
            path: 'compare-page-wrapper',
            args: CompareRouteWrapperArgs(
                key: key, origObj: origObj, hashObject: hashObject));

  static const String name = 'CompareRouteWrapper';
}

class CompareRouteWrapperArgs {
  const CompareRouteWrapperArgs(
      {this.key, required this.origObj, required this.hashObject});

  final Key? key;

  final Snapshot origObj;

  final HashObject hashObject;

  @override
  String toString() {
    return 'CompareRouteWrapperArgs{key: $key, origObj: $origObj, hashObject: $hashObject}';
  }
}

/// generated route for
/// [SaveObjectDialog]
class SaveObjectDialogRoute extends PageRouteInfo<SaveObjectDialogRouteArgs> {
  SaveObjectDialogRoute({Key? key, required Snapshot snapshot})
      : super(SaveObjectDialogRoute.name,
            path: 'save-object-dialog',
            args: SaveObjectDialogRouteArgs(key: key, snapshot: snapshot));

  static const String name = 'SaveObjectDialogRoute';
}

class SaveObjectDialogRouteArgs {
  const SaveObjectDialogRouteArgs({this.key, required this.snapshot});

  final Key? key;

  final Snapshot snapshot;

  @override
  String toString() {
    return 'SaveObjectDialogRouteArgs{key: $key, snapshot: $snapshot}';
  }
}

/// generated route for
/// [SaveHashDialog]
class SaveHashDialogRoute extends PageRouteInfo<SaveHashDialogRouteArgs> {
  SaveHashDialogRoute(
      {Key? key,
      required Snapshot hashesModelToSave,
      required HashObject hashObject})
      : super(SaveHashDialogRoute.name,
            path: 'save-hash-dialog',
            args: SaveHashDialogRouteArgs(
                key: key,
                hashesModelToSave: hashesModelToSave,
                hashObject: hashObject));

  static const String name = 'SaveHashDialogRoute';
}

class SaveHashDialogRouteArgs {
  const SaveHashDialogRouteArgs(
      {this.key, required this.hashesModelToSave, required this.hashObject});

  final Key? key;

  final Snapshot hashesModelToSave;

  final HashObject hashObject;

  @override
  String toString() {
    return 'SaveHashDialogRouteArgs{key: $key, hashesModelToSave: $hashesModelToSave, hashObject: $hashObject}';
  }
}
