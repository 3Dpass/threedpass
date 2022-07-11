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
    ExplorerRoute.name: (routeData) {
      final args = routeData.argsAs<ExplorerRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ExplorerPage(key: args.key, initialUrl: args.initialUrl));
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ErrorPage(key: args.key, error: args.error));
    },
    ScanWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ScanPageWrapper());
    },
    WalletRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WalletPage());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    CalcHashLoadingDialogRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const CalcHashLoadingWidget(),
          customRouteBuilder: dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ScanRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ScanPage());
    },
    PreviewWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewWrapperRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PreviewPageWrapper(
              key: args.key,
              hashObject: args.hashObject,
              snapshot: args.snapshot,
              createNewAnyway: args.createNewAnyway));
    },
    PreviewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewPage());
    },
    CompareWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<CompareWrapperRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ComparePageWrapper(
              key: args.key,
              origObj: args.origObj,
              hashObject: args.hashObject));
    },
    SaveTopHashesDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveTopHashesDialogRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SaveTopHashesDialog(
              key: args.key,
              hashObject: args.hashObject,
              snapshot: args.snapshot),
          customRouteBuilder: dialogBuilder,
          opaque: true,
          barrierDismissible: false);
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
              snapshot: args.snapshot,
              hashObject: args.hashObject),
          customRouteBuilder: dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    RenameSnapshotDialogRoute.name: (routeData) {
      final args = routeData.argsAs<RenameSnapshotDialogRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: RenameSnapshotDialog(
              key: args.key,
              snapshot: args.snapshot,
              hashObject: args.hashObject),
          customRouteBuilder: dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', children: [
          RouteConfig(ScanWrapperRoute.name,
              path: 'scan-page-wrapper',
              parent: HomeRoute.name,
              children: [
                RouteConfig(ScanRoute.name,
                    path: '', parent: ScanWrapperRoute.name),
                RouteConfig(PreviewWrapperRoute.name,
                    path: 'preview-page-wrapper',
                    parent: ScanWrapperRoute.name,
                    children: [
                      RouteConfig(PreviewRoute.name,
                          path: '', parent: PreviewWrapperRoute.name),
                      RouteConfig(CompareWrapperRoute.name,
                          path: 'compare-page-wrapper',
                          parent: PreviewWrapperRoute.name),
                      RouteConfig(SaveTopHashesDialogRoute.name,
                          path: 'save-top-hashes-dialog',
                          parent: PreviewWrapperRoute.name),
                      RouteConfig(SaveObjectDialogRoute.name,
                          path: 'save-object-dialog',
                          parent: PreviewWrapperRoute.name),
                      RouteConfig(SaveHashDialogRoute.name,
                          path: 'save-hash-dialog',
                          parent: PreviewWrapperRoute.name),
                      RouteConfig(RenameSnapshotDialogRoute.name,
                          path: 'rename-snapshot-dialog',
                          parent: PreviewWrapperRoute.name)
                    ])
              ]),
          RouteConfig(WalletRoute.name,
              path: 'wallet-page', parent: HomeRoute.name),
          RouteConfig(SettingsRoute.name,
              path: 'settings-page', parent: HomeRoute.name),
          RouteConfig(CalcHashLoadingDialogRoute.name,
              path: 'calc-hash-loading-widget', parent: HomeRoute.name)
        ]),
        RouteConfig(ExplorerRoute.name, path: '/explorer-page'),
        RouteConfig(ErrorRoute.name, path: '/error-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ExplorerPage]
class ExplorerRoute extends PageRouteInfo<ExplorerRouteArgs> {
  ExplorerRoute({Key? key, required String initialUrl})
      : super(ExplorerRoute.name,
            path: '/explorer-page',
            args: ExplorerRouteArgs(key: key, initialUrl: initialUrl));

  static const String name = 'ExplorerRoute';
}

class ExplorerRouteArgs {
  const ExplorerRouteArgs({this.key, required this.initialUrl});

  final Key? key;

  final String initialUrl;

  @override
  String toString() {
    return 'ExplorerRouteArgs{key: $key, initialUrl: $initialUrl}';
  }
}

/// generated route for
/// [ErrorPage]
class ErrorRoute extends PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({Key? key, required Object error})
      : super(ErrorRoute.name,
            path: '/error-page', args: ErrorRouteArgs(key: key, error: error));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.error});

  final Key? key;

  final Object error;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, error: $error}';
  }
}

/// generated route for
/// [ScanPageWrapper]
class ScanWrapperRoute extends PageRouteInfo<void> {
  const ScanWrapperRoute({List<PageRouteInfo>? children})
      : super(ScanWrapperRoute.name,
            path: 'scan-page-wrapper', initialChildren: children);

  static const String name = 'ScanWrapperRoute';
}

/// generated route for
/// [WalletPage]
class WalletRoute extends PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: 'wallet-page');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [CalcHashLoadingWidget]
class CalcHashLoadingDialogRoute extends PageRouteInfo<void> {
  const CalcHashLoadingDialogRoute()
      : super(CalcHashLoadingDialogRoute.name,
            path: 'calc-hash-loading-widget');

  static const String name = 'CalcHashLoadingDialogRoute';
}

/// generated route for
/// [ScanPage]
class ScanRoute extends PageRouteInfo<void> {
  const ScanRoute() : super(ScanRoute.name, path: '');

  static const String name = 'ScanRoute';
}

/// generated route for
/// [PreviewPageWrapper]
class PreviewWrapperRoute extends PageRouteInfo<PreviewWrapperRouteArgs> {
  PreviewWrapperRoute(
      {Key? key,
      required HashObject? hashObject,
      required Snapshot snapshot,
      bool createNewAnyway = false,
      List<PageRouteInfo>? children})
      : super(PreviewWrapperRoute.name,
            path: 'preview-page-wrapper',
            args: PreviewWrapperRouteArgs(
                key: key,
                hashObject: hashObject,
                snapshot: snapshot,
                createNewAnyway: createNewAnyway),
            initialChildren: children);

  static const String name = 'PreviewWrapperRoute';
}

class PreviewWrapperRouteArgs {
  const PreviewWrapperRouteArgs(
      {this.key,
      required this.hashObject,
      required this.snapshot,
      this.createNewAnyway = false});

  final Key? key;

  final HashObject? hashObject;

  final Snapshot snapshot;

  final bool createNewAnyway;

  @override
  String toString() {
    return 'PreviewWrapperRouteArgs{key: $key, hashObject: $hashObject, snapshot: $snapshot, createNewAnyway: $createNewAnyway}';
  }
}

/// generated route for
/// [PreviewPage]
class PreviewRoute extends PageRouteInfo<void> {
  const PreviewRoute() : super(PreviewRoute.name, path: '');

  static const String name = 'PreviewRoute';
}

/// generated route for
/// [ComparePageWrapper]
class CompareWrapperRoute extends PageRouteInfo<CompareWrapperRouteArgs> {
  CompareWrapperRoute(
      {Key? key, required Snapshot origObj, required HashObject hashObject})
      : super(CompareWrapperRoute.name,
            path: 'compare-page-wrapper',
            args: CompareWrapperRouteArgs(
                key: key, origObj: origObj, hashObject: hashObject));

  static const String name = 'CompareWrapperRoute';
}

class CompareWrapperRouteArgs {
  const CompareWrapperRouteArgs(
      {this.key, required this.origObj, required this.hashObject});

  final Key? key;

  final Snapshot origObj;

  final HashObject hashObject;

  @override
  String toString() {
    return 'CompareWrapperRouteArgs{key: $key, origObj: $origObj, hashObject: $hashObject}';
  }
}

/// generated route for
/// [SaveTopHashesDialog]
class SaveTopHashesDialogRoute
    extends PageRouteInfo<SaveTopHashesDialogRouteArgs> {
  SaveTopHashesDialogRoute(
      {Key? key, required HashObject? hashObject, required Snapshot snapshot})
      : super(SaveTopHashesDialogRoute.name,
            path: 'save-top-hashes-dialog',
            args: SaveTopHashesDialogRouteArgs(
                key: key, hashObject: hashObject, snapshot: snapshot));

  static const String name = 'SaveTopHashesDialogRoute';
}

class SaveTopHashesDialogRouteArgs {
  const SaveTopHashesDialogRouteArgs(
      {this.key, required this.hashObject, required this.snapshot});

  final Key? key;

  final HashObject? hashObject;

  final Snapshot snapshot;

  @override
  String toString() {
    return 'SaveTopHashesDialogRouteArgs{key: $key, hashObject: $hashObject, snapshot: $snapshot}';
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
      {Key? key, required Snapshot snapshot, required HashObject hashObject})
      : super(SaveHashDialogRoute.name,
            path: 'save-hash-dialog',
            args: SaveHashDialogRouteArgs(
                key: key, snapshot: snapshot, hashObject: hashObject));

  static const String name = 'SaveHashDialogRoute';
}

class SaveHashDialogRouteArgs {
  const SaveHashDialogRouteArgs(
      {this.key, required this.snapshot, required this.hashObject});

  final Key? key;

  final Snapshot snapshot;

  final HashObject hashObject;

  @override
  String toString() {
    return 'SaveHashDialogRouteArgs{key: $key, snapshot: $snapshot, hashObject: $hashObject}';
  }
}

/// generated route for
/// [RenameSnapshotDialog]
class RenameSnapshotDialogRoute
    extends PageRouteInfo<RenameSnapshotDialogRouteArgs> {
  RenameSnapshotDialogRoute(
      {Key? key, required Snapshot snapshot, required HashObject hashObject})
      : super(RenameSnapshotDialogRoute.name,
            path: 'rename-snapshot-dialog',
            args: RenameSnapshotDialogRouteArgs(
                key: key, snapshot: snapshot, hashObject: hashObject));

  static const String name = 'RenameSnapshotDialogRoute';
}

class RenameSnapshotDialogRouteArgs {
  const RenameSnapshotDialogRouteArgs(
      {this.key, required this.snapshot, required this.hashObject});

  final Key? key;

  final Snapshot snapshot;

  final HashObject hashObject;

  @override
  String toString() {
    return 'RenameSnapshotDialogRouteArgs{key: $key, snapshot: $snapshot, hashObject: $hashObject}';
  }
}
