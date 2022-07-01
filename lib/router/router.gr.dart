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
    HomePageRoute.name: (routeData) {
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
    SettingsPageRoute.name: (routeData) {
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
    PreviewPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewPage());
    },
    ComparePageWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ComparePageWrapperRouteArgs>();
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
              hashesModelToSave: args.hashesModelToSave,
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
              hashesModelToSave: args.hashesModelToSave,
              hashObject: args.hashObject),
          customRouteBuilder: dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomePageRoute.name, path: '/'),
        RouteConfig(PreviewPageWrapperRoute.name,
            path: '/preview-page-wrapper',
            children: [
              RouteConfig(PreviewPageRoute.name,
                  path: '', parent: PreviewPageWrapperRoute.name),
              RouteConfig(ComparePageWrapperRoute.name,
                  path: 'compare-page-wrapper',
                  parent: PreviewPageWrapperRoute.name),
              RouteConfig(SaveTopHashesDialogRoute.name,
                  path: 'save-top-hashes-dialog',
                  parent: PreviewPageWrapperRoute.name),
              RouteConfig(SaveObjectDialogRoute.name,
                  path: 'save-object-dialog',
                  parent: PreviewPageWrapperRoute.name),
              RouteConfig(SaveHashDialogRoute.name,
                  path: 'save-hash-dialog',
                  parent: PreviewPageWrapperRoute.name),
              RouteConfig(RenameSnapshotDialogRoute.name,
                  path: 'rename-snapshot-dialog',
                  parent: PreviewPageWrapperRoute.name)
            ]),
        RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        RouteConfig(CalcHashLoadingDialogRoute.name,
            path: '/calc-hash-loading-widget')
      ];
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
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
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [CalcHashLoadingWidget]
class CalcHashLoadingDialogRoute extends PageRouteInfo<void> {
  const CalcHashLoadingDialogRoute()
      : super(CalcHashLoadingDialogRoute.name,
            path: '/calc-hash-loading-widget');

  static const String name = 'CalcHashLoadingDialogRoute';
}

/// generated route for
/// [PreviewPage]
class PreviewPageRoute extends PageRouteInfo<void> {
  const PreviewPageRoute() : super(PreviewPageRoute.name, path: '');

  static const String name = 'PreviewPageRoute';
}

/// generated route for
/// [ComparePageWrapper]
class ComparePageWrapperRoute
    extends PageRouteInfo<ComparePageWrapperRouteArgs> {
  ComparePageWrapperRoute(
      {Key? key, required Snapshot origObj, required HashObject hashObject})
      : super(ComparePageWrapperRoute.name,
            path: 'compare-page-wrapper',
            args: ComparePageWrapperRouteArgs(
                key: key, origObj: origObj, hashObject: hashObject));

  static const String name = 'ComparePageWrapperRoute';
}

class ComparePageWrapperRouteArgs {
  const ComparePageWrapperRouteArgs(
      {this.key, required this.origObj, required this.hashObject});

  final Key? key;

  final Snapshot origObj;

  final HashObject hashObject;

  @override
  String toString() {
    return 'ComparePageWrapperRouteArgs{key: $key, origObj: $origObj, hashObject: $hashObject}';
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

/// generated route for
/// [RenameSnapshotDialog]
class RenameSnapshotDialogRoute
    extends PageRouteInfo<RenameSnapshotDialogRouteArgs> {
  RenameSnapshotDialogRoute(
      {Key? key,
      required Snapshot hashesModelToSave,
      required HashObject hashObject})
      : super(RenameSnapshotDialogRoute.name,
            path: 'rename-snapshot-dialog',
            args: RenameSnapshotDialogRouteArgs(
                key: key,
                hashesModelToSave: hashesModelToSave,
                hashObject: hashObject));

  static const String name = 'RenameSnapshotDialogRoute';
}

class RenameSnapshotDialogRouteArgs {
  const RenameSnapshotDialogRouteArgs(
      {this.key, required this.hashesModelToSave, required this.hashObject});

  final Key? key;

  final Snapshot hashesModelToSave;

  final HashObject hashObject;

  @override
  String toString() {
    return 'RenameSnapshotDialogRouteArgs{key: $key, hashesModelToSave: $hashesModelToSave, hashObject: $hashObject}';
  }
}
