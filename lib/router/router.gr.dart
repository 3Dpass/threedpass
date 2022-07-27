// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i24;

import '../core/polkawallet/app_service.dart' as _i28;
import '../core/widgets/default_loading_dialog.dart' as _i7;
import '../core/widgets/error_page.dart' as _i4;
import '../features/accounts/presentation/pages/create_account_credentials.dart'
    as _i22;
import '../features/accounts/presentation/pages/create_account_info_page.dart'
    as _i19;
import '../features/accounts/presentation/pages/create_account_loader.dart'
    as _i23;
import '../features/accounts/presentation/pages/create_account_mnemonic_backup.dart'
    as _i20;
import '../features/accounts/presentation/pages/create_account_mnemonic_confirm.dart'
    as _i21;
import '../features/accounts/presentation/pages/create_account_wrapper.dart'
    as _i5;
import '../features/compare_page.dart/presentation/pages/compare_page_wrapper.dart'
    as _i14;
import '../features/hashes_list/domain/entities/hash_object.dart' as _i26;
import '../features/hashes_list/domain/entities/snapshot.dart' as _i27;
import '../features/home_page/presentation/home_page.dart' as _i1;
import '../features/preview_page/bloc/preview_page_cubit.dart' as _i29;
import '../features/preview_page/presentation/pages/preview_page.dart' as _i13;
import '../features/preview_page/presentation/pages/preview_page_wrapper.dart'
    as _i2;
import '../features/preview_page/presentation/widgets/rename_snapshot_dialog.dart'
    as _i18;
import '../features/preview_page/presentation/widgets/save_hash_dialog.dart'
    as _i17;
import '../features/preview_page/presentation/widgets/save_object_dialog.dart'
    as _i16;
import '../features/preview_page/presentation/widgets/save_top_hashes_dialog/save_top_hashes_dialog.dart'
    as _i15;
import '../features/scan_page/presentation/pages/scan_page.dart' as _i11;
import '../features/scan_page/presentation/pages/scan_page_wrapper.dart' as _i8;
import '../features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart'
    as _i6;
import '../features/settings_page/presentation/pages/settings_page.dart'
    as _i10;
import '../features/wallet_screen/presentation/wallet_page.dart' as _i12;
import '../features/web_wallet/presentation/pages/explorer_page.dart' as _i3;
import 'router.dart' as _i25;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i24.GlobalKey<_i24.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    PreviewWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewWrapperRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.PreviewPageWrapper(
              key: args.key,
              hashObject: args.hashObject,
              snapshot: args.snapshot,
              createNewAnyway: args.createNewAnyway));
    },
    WebWalletRoute.name: (routeData) {
      final args = routeData.argsAs<WebWalletRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.WebWalletPage(key: args.key, initialUrl: args.initialUrl));
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ErrorPage(key: args.key, error: args.error));
    },
    CreateAccountWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountWrapperRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.CreateAccountWrapper(
              key: args.key, appService: args.appService));
    },
    CalcHashLoadingDialogRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.CalcHashLoadingWidget(),
          customRouteBuilder: _i25.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    DefaultLoadingDialogRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.DefaultLoadingDialog(),
          customRouteBuilder: _i25.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ScanWrapperRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ScanPageWrapper());
    },
    WalletWrapperRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    SettingsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SettingsPage());
    },
    ScanRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ScanPage());
    },
    WalletRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.WalletPage());
    },
    PreviewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.PreviewPage());
    },
    CompareWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<CompareWrapperRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.ComparePageWrapper(
              key: args.key,
              origObj: args.origObj,
              hashObject: args.hashObject));
    },
    SaveTopHashesDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveTopHashesDialogRouteArgs>();
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i15.SaveTopHashesDialog(
              key: args.key, pageCubitState: args.pageCubitState),
          customRouteBuilder: _i25.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SaveObjectDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveObjectDialogRouteArgs>();
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i16.SaveObjectDialog(key: args.key, snapshot: args.snapshot),
          customRouteBuilder: _i25.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SaveHashDialogRoute.name: (routeData) {
      final args = routeData.argsAs<SaveHashDialogRouteArgs>();
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i17.SaveHashDialog(
              key: args.key,
              snapshot: args.snapshot,
              hashObject: args.hashObject),
          customRouteBuilder: _i25.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    RenameSnapshotDialogRoute.name: (routeData) {
      final args = routeData.argsAs<RenameSnapshotDialogRouteArgs>();
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i18.RenameSnapshotDialog(
              key: args.key,
              snapshot: args.snapshot,
              hashObject: args.hashObject),
          customRouteBuilder: _i25.dialogBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    CreateAccountInfoRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.CreateAccountInfoPage());
    },
    MnemonicBackupRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i20.CreateAccountMnemonicBackup());
    },
    MnemonicConfirmRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i21.CreateAccountMnemonicConfirm());
    },
    CreateAccountCredentialsRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountCredentialsRouteArgs>(
          orElse: () => const CreateAccountCredentialsRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i22.CreateAccountCredentials(key: args.key));
    },
    CreateAccountLoaderRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.CreateAccountLoader());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(HomeRoute.name, path: '/', children: [
          _i9.RouteConfig(ScanWrapperRoute.name,
              path: 'scan-page-wrapper',
              parent: HomeRoute.name,
              children: [
                _i9.RouteConfig(ScanRoute.name,
                    path: '', parent: ScanWrapperRoute.name)
              ]),
          _i9.RouteConfig(WalletWrapperRoute.name,
              path: 'empty-router-page',
              parent: HomeRoute.name,
              children: [
                _i9.RouteConfig(WalletRoute.name,
                    path: '', parent: WalletWrapperRoute.name)
              ]),
          _i9.RouteConfig(SettingsRoute.name,
              path: 'settings-page', parent: HomeRoute.name)
        ]),
        _i9.RouteConfig(PreviewWrapperRoute.name,
            path: '/preview-page-wrapper',
            children: [
              _i9.RouteConfig(PreviewRoute.name,
                  path: '', parent: PreviewWrapperRoute.name),
              _i9.RouteConfig(CompareWrapperRoute.name,
                  path: 'compare-page-wrapper',
                  parent: PreviewWrapperRoute.name),
              _i9.RouteConfig(SaveTopHashesDialogRoute.name,
                  path: 'save-top-hashes-dialog',
                  parent: PreviewWrapperRoute.name),
              _i9.RouteConfig(SaveObjectDialogRoute.name,
                  path: 'save-object-dialog', parent: PreviewWrapperRoute.name),
              _i9.RouteConfig(SaveHashDialogRoute.name,
                  path: 'save-hash-dialog', parent: PreviewWrapperRoute.name),
              _i9.RouteConfig(RenameSnapshotDialogRoute.name,
                  path: 'rename-snapshot-dialog',
                  parent: PreviewWrapperRoute.name)
            ]),
        _i9.RouteConfig(WebWalletRoute.name, path: '/web-wallet-page'),
        _i9.RouteConfig(ErrorRoute.name, path: '/error-page'),
        _i9.RouteConfig(CreateAccountWrapperRoute.name,
            path: '/create-account-wrapper',
            children: [
              _i9.RouteConfig(CreateAccountInfoRoute.name,
                  path: '', parent: CreateAccountWrapperRoute.name),
              _i9.RouteConfig(MnemonicBackupRoute.name,
                  path: 'create-account-mnemonic-backup',
                  parent: CreateAccountWrapperRoute.name),
              _i9.RouteConfig(MnemonicConfirmRoute.name,
                  path: 'create-account-mnemonic-confirm',
                  parent: CreateAccountWrapperRoute.name),
              _i9.RouteConfig(CreateAccountCredentialsRoute.name,
                  path: 'create-account-credentials',
                  parent: CreateAccountWrapperRoute.name),
              _i9.RouteConfig(CreateAccountLoaderRoute.name,
                  path: 'create-account-loader',
                  parent: CreateAccountWrapperRoute.name)
            ]),
        _i9.RouteConfig(CalcHashLoadingDialogRoute.name,
            path: '/calc-hash-loading-widget'),
        _i9.RouteConfig(DefaultLoadingDialogRoute.name,
            path: '/default-loading-dialog')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.PreviewPageWrapper]
class PreviewWrapperRoute extends _i9.PageRouteInfo<PreviewWrapperRouteArgs> {
  PreviewWrapperRoute(
      {_i24.Key? key,
      required _i26.HashObject? hashObject,
      required _i27.Snapshot snapshot,
      bool createNewAnyway = false,
      List<_i9.PageRouteInfo>? children})
      : super(PreviewWrapperRoute.name,
            path: '/preview-page-wrapper',
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

  final _i24.Key? key;

  final _i26.HashObject? hashObject;

  final _i27.Snapshot snapshot;

  final bool createNewAnyway;

  @override
  String toString() {
    return 'PreviewWrapperRouteArgs{key: $key, hashObject: $hashObject, snapshot: $snapshot, createNewAnyway: $createNewAnyway}';
  }
}

/// generated route for
/// [_i3.WebWalletPage]
class WebWalletRoute extends _i9.PageRouteInfo<WebWalletRouteArgs> {
  WebWalletRoute({_i24.Key? key, required String initialUrl})
      : super(WebWalletRoute.name,
            path: '/web-wallet-page',
            args: WebWalletRouteArgs(key: key, initialUrl: initialUrl));

  static const String name = 'WebWalletRoute';
}

class WebWalletRouteArgs {
  const WebWalletRouteArgs({this.key, required this.initialUrl});

  final _i24.Key? key;

  final String initialUrl;

  @override
  String toString() {
    return 'WebWalletRouteArgs{key: $key, initialUrl: $initialUrl}';
  }
}

/// generated route for
/// [_i4.ErrorPage]
class ErrorRoute extends _i9.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({_i24.Key? key, required Object error})
      : super(ErrorRoute.name,
            path: '/error-page', args: ErrorRouteArgs(key: key, error: error));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.error});

  final _i24.Key? key;

  final Object error;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, error: $error}';
  }
}

/// generated route for
/// [_i5.CreateAccountWrapper]
class CreateAccountWrapperRoute
    extends _i9.PageRouteInfo<CreateAccountWrapperRouteArgs> {
  CreateAccountWrapperRoute(
      {_i24.Key? key,
      required _i28.AppService appService,
      List<_i9.PageRouteInfo>? children})
      : super(CreateAccountWrapperRoute.name,
            path: '/create-account-wrapper',
            args:
                CreateAccountWrapperRouteArgs(key: key, appService: appService),
            initialChildren: children);

  static const String name = 'CreateAccountWrapperRoute';
}

class CreateAccountWrapperRouteArgs {
  const CreateAccountWrapperRouteArgs({this.key, required this.appService});

  final _i24.Key? key;

  final _i28.AppService appService;

  @override
  String toString() {
    return 'CreateAccountWrapperRouteArgs{key: $key, appService: $appService}';
  }
}

/// generated route for
/// [_i6.CalcHashLoadingWidget]
class CalcHashLoadingDialogRoute extends _i9.PageRouteInfo<void> {
  const CalcHashLoadingDialogRoute()
      : super(CalcHashLoadingDialogRoute.name,
            path: '/calc-hash-loading-widget');

  static const String name = 'CalcHashLoadingDialogRoute';
}

/// generated route for
/// [_i7.DefaultLoadingDialog]
class DefaultLoadingDialogRoute extends _i9.PageRouteInfo<void> {
  const DefaultLoadingDialogRoute()
      : super(DefaultLoadingDialogRoute.name, path: '/default-loading-dialog');

  static const String name = 'DefaultLoadingDialogRoute';
}

/// generated route for
/// [_i8.ScanPageWrapper]
class ScanWrapperRoute extends _i9.PageRouteInfo<void> {
  const ScanWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(ScanWrapperRoute.name,
            path: 'scan-page-wrapper', initialChildren: children);

  static const String name = 'ScanWrapperRoute';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class WalletWrapperRoute extends _i9.PageRouteInfo<void> {
  const WalletWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(WalletWrapperRoute.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'WalletWrapperRoute';
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i11.ScanPage]
class ScanRoute extends _i9.PageRouteInfo<void> {
  const ScanRoute() : super(ScanRoute.name, path: '');

  static const String name = 'ScanRoute';
}

/// generated route for
/// [_i12.WalletPage]
class WalletRoute extends _i9.PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: '');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i13.PreviewPage]
class PreviewRoute extends _i9.PageRouteInfo<void> {
  const PreviewRoute() : super(PreviewRoute.name, path: '');

  static const String name = 'PreviewRoute';
}

/// generated route for
/// [_i14.ComparePageWrapper]
class CompareWrapperRoute extends _i9.PageRouteInfo<CompareWrapperRouteArgs> {
  CompareWrapperRoute(
      {_i24.Key? key,
      required _i27.Snapshot origObj,
      required _i26.HashObject hashObject})
      : super(CompareWrapperRoute.name,
            path: 'compare-page-wrapper',
            args: CompareWrapperRouteArgs(
                key: key, origObj: origObj, hashObject: hashObject));

  static const String name = 'CompareWrapperRoute';
}

class CompareWrapperRouteArgs {
  const CompareWrapperRouteArgs(
      {this.key, required this.origObj, required this.hashObject});

  final _i24.Key? key;

  final _i27.Snapshot origObj;

  final _i26.HashObject hashObject;

  @override
  String toString() {
    return 'CompareWrapperRouteArgs{key: $key, origObj: $origObj, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i15.SaveTopHashesDialog]
class SaveTopHashesDialogRoute
    extends _i9.PageRouteInfo<SaveTopHashesDialogRouteArgs> {
  SaveTopHashesDialogRoute(
      {_i24.Key? key, required _i29.PreviewPageCubitState pageCubitState})
      : super(SaveTopHashesDialogRoute.name,
            path: 'save-top-hashes-dialog',
            args: SaveTopHashesDialogRouteArgs(
                key: key, pageCubitState: pageCubitState));

  static const String name = 'SaveTopHashesDialogRoute';
}

class SaveTopHashesDialogRouteArgs {
  const SaveTopHashesDialogRouteArgs({this.key, required this.pageCubitState});

  final _i24.Key? key;

  final _i29.PreviewPageCubitState pageCubitState;

  @override
  String toString() {
    return 'SaveTopHashesDialogRouteArgs{key: $key, pageCubitState: $pageCubitState}';
  }
}

/// generated route for
/// [_i16.SaveObjectDialog]
class SaveObjectDialogRoute
    extends _i9.PageRouteInfo<SaveObjectDialogRouteArgs> {
  SaveObjectDialogRoute({_i24.Key? key, required _i27.Snapshot snapshot})
      : super(SaveObjectDialogRoute.name,
            path: 'save-object-dialog',
            args: SaveObjectDialogRouteArgs(key: key, snapshot: snapshot));

  static const String name = 'SaveObjectDialogRoute';
}

class SaveObjectDialogRouteArgs {
  const SaveObjectDialogRouteArgs({this.key, required this.snapshot});

  final _i24.Key? key;

  final _i27.Snapshot snapshot;

  @override
  String toString() {
    return 'SaveObjectDialogRouteArgs{key: $key, snapshot: $snapshot}';
  }
}

/// generated route for
/// [_i17.SaveHashDialog]
class SaveHashDialogRoute extends _i9.PageRouteInfo<SaveHashDialogRouteArgs> {
  SaveHashDialogRoute(
      {_i24.Key? key,
      required _i27.Snapshot snapshot,
      required _i26.HashObject hashObject})
      : super(SaveHashDialogRoute.name,
            path: 'save-hash-dialog',
            args: SaveHashDialogRouteArgs(
                key: key, snapshot: snapshot, hashObject: hashObject));

  static const String name = 'SaveHashDialogRoute';
}

class SaveHashDialogRouteArgs {
  const SaveHashDialogRouteArgs(
      {this.key, required this.snapshot, required this.hashObject});

  final _i24.Key? key;

  final _i27.Snapshot snapshot;

  final _i26.HashObject hashObject;

  @override
  String toString() {
    return 'SaveHashDialogRouteArgs{key: $key, snapshot: $snapshot, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i18.RenameSnapshotDialog]
class RenameSnapshotDialogRoute
    extends _i9.PageRouteInfo<RenameSnapshotDialogRouteArgs> {
  RenameSnapshotDialogRoute(
      {_i24.Key? key,
      required _i27.Snapshot snapshot,
      required _i26.HashObject hashObject})
      : super(RenameSnapshotDialogRoute.name,
            path: 'rename-snapshot-dialog',
            args: RenameSnapshotDialogRouteArgs(
                key: key, snapshot: snapshot, hashObject: hashObject));

  static const String name = 'RenameSnapshotDialogRoute';
}

class RenameSnapshotDialogRouteArgs {
  const RenameSnapshotDialogRouteArgs(
      {this.key, required this.snapshot, required this.hashObject});

  final _i24.Key? key;

  final _i27.Snapshot snapshot;

  final _i26.HashObject hashObject;

  @override
  String toString() {
    return 'RenameSnapshotDialogRouteArgs{key: $key, snapshot: $snapshot, hashObject: $hashObject}';
  }
}

/// generated route for
/// [_i19.CreateAccountInfoPage]
class CreateAccountInfoRoute extends _i9.PageRouteInfo<void> {
  const CreateAccountInfoRoute() : super(CreateAccountInfoRoute.name, path: '');

  static const String name = 'CreateAccountInfoRoute';
}

/// generated route for
/// [_i20.CreateAccountMnemonicBackup]
class MnemonicBackupRoute extends _i9.PageRouteInfo<void> {
  const MnemonicBackupRoute()
      : super(MnemonicBackupRoute.name, path: 'create-account-mnemonic-backup');

  static const String name = 'MnemonicBackupRoute';
}

/// generated route for
/// [_i21.CreateAccountMnemonicConfirm]
class MnemonicConfirmRoute extends _i9.PageRouteInfo<void> {
  const MnemonicConfirmRoute()
      : super(MnemonicConfirmRoute.name,
            path: 'create-account-mnemonic-confirm');

  static const String name = 'MnemonicConfirmRoute';
}

/// generated route for
/// [_i22.CreateAccountCredentials]
class CreateAccountCredentialsRoute
    extends _i9.PageRouteInfo<CreateAccountCredentialsRouteArgs> {
  CreateAccountCredentialsRoute({_i24.Key? key})
      : super(CreateAccountCredentialsRoute.name,
            path: 'create-account-credentials',
            args: CreateAccountCredentialsRouteArgs(key: key));

  static const String name = 'CreateAccountCredentialsRoute';
}

class CreateAccountCredentialsRouteArgs {
  const CreateAccountCredentialsRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'CreateAccountCredentialsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.CreateAccountLoader]
class CreateAccountLoaderRoute extends _i9.PageRouteInfo<void> {
  const CreateAccountLoaderRoute()
      : super(CreateAccountLoaderRoute.name, path: 'create-account-loader');

  static const String name = 'CreateAccountLoaderRoute';
}
