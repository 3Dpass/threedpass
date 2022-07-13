// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i19;

import '../core/widgets/error_page.dart' as _i4;
import '../features/accounts/presentation/pages/create_account_info_page.dart'
    as _i17;
import '../features/accounts/presentation/pages/create_account_mnemonic_gen.dart'
    as _i18;
import '../features/compare_page.dart/presentation/pages/compare_page_wrapper.dart'
    as _i11;
import '../features/explorer/presentation/pages/explorer_page.dart' as _i2;
import '../features/hashes_list/domain/entities/hash_object.dart' as _i21;
import '../features/hashes_list/domain/entities/snapshot.dart' as _i22;
import '../features/home_page/presentation/home_page.dart' as _i1;
import '../features/preview_page/presentation/bloc/preview_page_cubit.dart'
    as _i23;
import '../features/preview_page/presentation/pages/preview_page.dart' as _i10;
import '../features/preview_page/presentation/pages/preview_page_wrapper.dart'
    as _i9;
import '../features/preview_page/presentation/widgets/rename_snapshot_dialog.dart'
    as _i15;
import '../features/preview_page/presentation/widgets/save_hash_dialog.dart'
    as _i14;
import '../features/preview_page/presentation/widgets/save_object_dialog.dart'
    as _i13;
import '../features/preview_page/presentation/widgets/save_top_hashes_dialog/save_top_hashes_dialog.dart'
    as _i12;
import '../features/scan_page/presentation/pages/scan_page.dart' as _i8;
import '../features/scan_page/presentation/pages/scan_page_wrapper.dart' as _i6;
import '../features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart'
    as _i5;
import '../features/settings_page/presentation/pages/settings_page.dart' as _i7;
import '../features/wallet_page/presentation/wallet_page.dart' as _i16;
import 'router.dart' as _i20;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ExplorerRoute.name: (routeData) {
      final args = routeData.argsAs<ExplorerRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ExplorerPage(key: args.key, initialUrl: args.initialUrl));
    },
    CreateAccountWrapperRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ErrorPage(key: args.key, error: args.error));
    },
    CalcHashLoadingDialogRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.CalcHashLoadingWidget(),
          customRouteBuilder: _i20.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ScanWrapperRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ScanPageWrapper());
    },
    WalletWrapperRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    SettingsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SettingsPage());
    },
    ScanRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ScanPage());
    },
    PreviewWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewWrapperRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.PreviewPageWrapper(
              key: args.key,
              hashObject: args.hashObject,
              snapshot: args.snapshot,
              createNewAnyway: args.createNewAnyway));
    },
    PreviewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.PreviewPage());
    },
    CompareWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<CompareWrapperRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ComparePageWrapper(
              key: args.key,
              origObj: args.origObj,
              hashObject: args.hashObject));
    },
    SaveTopHashesDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveTopHashesDialogRouteArgs>();
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.SaveTopHashesDialog(
              key: args.key, pageCubitState: args.pageCubitState),
          customRouteBuilder: _i20.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SaveObjectDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveObjectDialogRouteArgs>();
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: _i13.SaveObjectDialog(key: args.key, snapshot: args.snapshot),
          customRouteBuilder: _i20.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SaveHashDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveHashDialogRouteArgs>();
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: _i14.SaveHashDialog(
              key: args.key,
              snapshot: args.snapshot,
              hashObject: args.hashObject),
          customRouteBuilder: _i20.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    RenameSnapshotDialogRoute.name: (routeData) {
      final args = routeData.argsAs<RenameSnapshotDialogRouteArgs>();
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: _i15.RenameSnapshotDialog(
              key: args.key,
              snapshot: args.snapshot,
              hashObject: args.hashObject),
          customRouteBuilder: _i20.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    WalletRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.WalletPage());
    },
    CreateAccountInfoRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.CreateAccountInfoPage());
    },
    MnemonicGenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.CreateAccountMnemonicGen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomeRoute.name, path: '/', children: [
          _i3.RouteConfig(ScanWrapperRoute.name,
              path: 'scan-page-wrapper',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(ScanRoute.name,
                    path: '', parent: ScanWrapperRoute.name),
                _i3.RouteConfig(PreviewWrapperRoute.name,
                    path: 'preview-page-wrapper',
                    parent: ScanWrapperRoute.name,
                    children: [
                      _i3.RouteConfig(PreviewRoute.name,
                          path: '', parent: PreviewWrapperRoute.name),
                      _i3.RouteConfig(CompareWrapperRoute.name,
                          path: 'compare-page-wrapper',
                          parent: PreviewWrapperRoute.name),
                      _i3.RouteConfig(SaveTopHashesDialogRoute.name,
                          path: 'save-top-hashes-dialog',
                          parent: PreviewWrapperRoute.name),
                      _i3.RouteConfig(SaveObjectDialogRoute.name,
                          path: 'save-object-dialog',
                          parent: PreviewWrapperRoute.name),
                      _i3.RouteConfig(SaveHashDialogRoute.name,
                          path: 'save-hash-dialog',
                          parent: PreviewWrapperRoute.name),
                      _i3.RouteConfig(RenameSnapshotDialogRoute.name,
                          path: 'rename-snapshot-dialog',
                          parent: PreviewWrapperRoute.name)
                    ])
              ]),
          _i3.RouteConfig(WalletWrapperRoute.name,
              path: 'empty-router-page',
              parent: HomeRoute.name,
              children: [
                _i3.RouteConfig(WalletRoute.name,
                    path: '', parent: WalletWrapperRoute.name)
              ]),
          _i3.RouteConfig(SettingsRoute.name,
              path: 'settings-page', parent: HomeRoute.name)
        ]),
        _i3.RouteConfig(ExplorerRoute.name, path: '/explorer-page'),
        _i3.RouteConfig(CreateAccountWrapperRoute.name,
            path: '/empty-router-page',
            children: [
              _i3.RouteConfig(CreateAccountInfoRoute.name,
                  path: '', parent: CreateAccountWrapperRoute.name),
              _i3.RouteConfig(MnemonicGenRoute.name,
                  path: 'create-account-mnemonic-gen',
                  parent: CreateAccountWrapperRoute.name)
            ]),
        _i3.RouteConfig(ErrorRoute.name, path: '/error-page'),
        _i3.RouteConfig(CalcHashLoadingDialogRoute.name,
            path: '/calc-hash-loading-widget')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ExplorerPage]
class ExplorerRoute extends _i3.PageRouteInfo<ExplorerRouteArgs> {
  ExplorerRoute({_i19.Key? key, required String initialUrl})
      : super(ExplorerRoute.name,
            path: '/explorer-page',
            args: ExplorerRouteArgs(key: key, initialUrl: initialUrl));

  static const String name = 'ExplorerRoute';
}

class ExplorerRouteArgs {
  const ExplorerRouteArgs({this.key, required this.initialUrl});

  final _i19.Key? key;

  final String initialUrl;

  @override
  String toString() {
    return 'ExplorerRouteArgs{key: $key, initialUrl: $initialUrl}';
  }
}

/// generated route for
/// [_i3.EmptyRouterPage]
class CreateAccountWrapperRoute extends _i3.PageRouteInfo<void> {
  const CreateAccountWrapperRoute({List<_i3.PageRouteInfo>? children})
      : super(CreateAccountWrapperRoute.name,
            path: '/empty-router-page', initialChildren: children);

  static const String name = 'CreateAccountWrapperRoute';
}

/// generated route for
/// [_i4.ErrorPage]
class ErrorRoute extends _i3.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({_i19.Key? key, required Object error})
      : super(ErrorRoute.name,
            path: '/error-page', args: ErrorRouteArgs(key: key, error: error));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.error});

  final _i19.Key? key;

  final Object error;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, error: $error}';
  }
}

/// generated route for
/// [_i5.CalcHashLoadingWidget]
class CalcHashLoadingDialogRoute extends _i3.PageRouteInfo<void> {
  const CalcHashLoadingDialogRoute()
      : super(CalcHashLoadingDialogRoute.name,
            path: '/calc-hash-loading-widget');

  static const String name = 'CalcHashLoadingDialogRoute';
}

/// generated route for
/// [_i6.ScanPageWrapper]
class ScanWrapperRoute extends _i3.PageRouteInfo<void> {
  const ScanWrapperRoute({List<_i3.PageRouteInfo>? children})
      : super(ScanWrapperRoute.name,
            path: 'scan-page-wrapper', initialChildren: children);

  static const String name = 'ScanWrapperRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class WalletWrapperRoute extends _i3.PageRouteInfo<void> {
  const WalletWrapperRoute({List<_i3.PageRouteInfo>? children})
      : super(WalletWrapperRoute.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'WalletWrapperRoute';
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i3.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i8.ScanPage]
class ScanRoute extends _i3.PageRouteInfo<void> {
  const ScanRoute() : super(ScanRoute.name, path: '');

  static const String name = 'ScanRoute';
}

/// generated route for
/// [_i9.PreviewPageWrapper]
class PreviewWrapperRoute extends _i3.PageRouteInfo<PreviewWrapperRouteArgs> {
  PreviewWrapperRoute(
      {_i19.Key? key,
      required _i21.HashObject? hashObject,
      required _i22.Snapshot snapshot,
      bool createNewAnyway = false,
      List<_i3.PageRouteInfo>? children})
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

  final _i19.Key? key;

  final _i21.HashObject? hashObject;

  final _i22.Snapshot snapshot;

  final bool createNewAnyway;

  @override
  String toString() {
    return 'PreviewWrapperRouteArgs{key: $key, hashObject: $hashObject, snapshot: $snapshot, createNewAnyway: $createNewAnyway}';
  }
}

/// generated route for
/// [_i10.PreviewPage]
class PreviewRoute extends _i3.PageRouteInfo<void> {
  const PreviewRoute() : super(PreviewRoute.name, path: '');

  static const String name = 'PreviewRoute';
}

/// generated route for
/// [_i11.ComparePageWrapper]
class CompareWrapperRoute extends _i3.PageRouteInfo<CompareWrapperRouteArgs> {
  CompareWrapperRoute(
      {_i19.Key? key,
      required _i22.Snapshot origObj,
      required _i21.HashObject hashObject})
      : super(CompareWrapperRoute.name,
            path: 'compare-page-wrapper',
            args: CompareWrapperRouteArgs(
                key: key, origObj: origObj, hashObject: hashObject));

  static const String name = 'CompareWrapperRoute';
}

class CompareWrapperRouteArgs {
  const CompareWrapperRouteArgs(
      {this.key, required this.origObj, required this.hashObject});

  final _i19.Key? key;

  final _i22.Snapshot origObj;

  final _i21.HashObject hashObject;

  @override
  String toString() {
    return 'CompareWrapperRouteArgs{key: $key, origObj: $origObj, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i12.SaveTopHashesDialog]
class SaveTopHashesDialogRoute
    extends _i3.PageRouteInfo<SaveTopHashesDialogRouteArgs> {
  SaveTopHashesDialogRoute(
      {_i19.Key? key, required _i23.PreviewPageCubitState pageCubitState})
      : super(SaveTopHashesDialogRoute.name,
            path: 'save-top-hashes-dialog',
            args: SaveTopHashesDialogRouteArgs(
                key: key, pageCubitState: pageCubitState));

  static const String name = 'SaveTopHashesDialogRoute';
}

class SaveTopHashesDialogRouteArgs {
  const SaveTopHashesDialogRouteArgs({this.key, required this.pageCubitState});

  final _i19.Key? key;

  final _i23.PreviewPageCubitState pageCubitState;

  @override
  String toString() {
    return 'SaveTopHashesDialogRouteArgs{key: $key, pageCubitState: $pageCubitState}';
  }
}

/// generated route for
/// [_i13.SaveObjectDialog]
class SaveObjectDialogRoute
    extends _i3.PageRouteInfo<SaveObjectDialogRouteArgs> {
  SaveObjectDialogRoute({_i19.Key? key, required _i22.Snapshot snapshot})
      : super(SaveObjectDialogRoute.name,
            path: 'save-object-dialog',
            args: SaveObjectDialogRouteArgs(key: key, snapshot: snapshot));

  static const String name = 'SaveObjectDialogRoute';
}

class SaveObjectDialogRouteArgs {
  const SaveObjectDialogRouteArgs({this.key, required this.snapshot});

  final _i19.Key? key;

  final _i22.Snapshot snapshot;

  @override
  String toString() {
    return 'SaveObjectDialogRouteArgs{key: $key, snapshot: $snapshot}';
  }
}

/// generated route for
/// [_i14.SaveHashDialog]
class SaveHashDialogRoute extends _i3.PageRouteInfo<SaveHashDialogRouteArgs> {
  SaveHashDialogRoute(
      {_i19.Key? key,
      required _i22.Snapshot snapshot,
      required _i21.HashObject hashObject})
      : super(SaveHashDialogRoute.name,
            path: 'save-hash-dialog',
            args: SaveHashDialogRouteArgs(
                key: key, snapshot: snapshot, hashObject: hashObject));

  static const String name = 'SaveHashDialogRoute';
}

class SaveHashDialogRouteArgs {
  const SaveHashDialogRouteArgs(
      {this.key, required this.snapshot, required this.hashObject});

  final _i19.Key? key;

  final _i22.Snapshot snapshot;

  final _i21.HashObject hashObject;

  @override
  String toString() {
    return 'SaveHashDialogRouteArgs{key: $key, snapshot: $snapshot, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i15.RenameSnapshotDialog]
class RenameSnapshotDialogRoute
    extends _i3.PageRouteInfo<RenameSnapshotDialogRouteArgs> {
  RenameSnapshotDialogRoute(
      {_i19.Key? key,
      required _i22.Snapshot snapshot,
      required _i21.HashObject hashObject})
      : super(RenameSnapshotDialogRoute.name,
            path: 'rename-snapshot-dialog',
            args: RenameSnapshotDialogRouteArgs(
                key: key, snapshot: snapshot, hashObject: hashObject));

  static const String name = 'RenameSnapshotDialogRoute';
}

class RenameSnapshotDialogRouteArgs {
  const RenameSnapshotDialogRouteArgs(
      {this.key, required this.snapshot, required this.hashObject});

  final _i19.Key? key;

  final _i22.Snapshot snapshot;

  final _i21.HashObject hashObject;

  @override
  String toString() {
    return 'RenameSnapshotDialogRouteArgs{key: $key, snapshot: $snapshot, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i16.WalletPage]
class WalletRoute extends _i3.PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: '');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i17.CreateAccountInfoPage]
class CreateAccountInfoRoute extends _i3.PageRouteInfo<void> {
  const CreateAccountInfoRoute() : super(CreateAccountInfoRoute.name, path: '');

  static const String name = 'CreateAccountInfoRoute';
}

/// generated route for
/// [_i18.CreateAccountMnemonicGen]
class MnemonicGenRoute extends _i3.PageRouteInfo<void> {
  const MnemonicGenRoute()
      : super(MnemonicGenRoute.name, path: 'create-account-mnemonic-gen');

  static const String name = 'MnemonicGenRoute';
}
