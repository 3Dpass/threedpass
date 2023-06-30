// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i37;
import 'package:flutter/material.dart' as _i38;
import 'package:flutter/widgets.dart' as _i44;
import 'package:threedpass/core/widgets/default_loading_dialog.dart' as _i2;
import 'package:threedpass/core/widgets/error_page.dart' as _i1;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_credentials.dart'
    as _i29;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_from_object/create_account_from_object.dart'
    as _i24;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_info_page.dart'
    as _i26;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_loader.dart'
    as _i31;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_backup.dart'
    as _i27;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_confirm.dart'
    as _i28;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_type.dart'
    as _i30;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart'
    as _i23;
import 'package:threedpass/features/accounts/presentation/pages/create_account/import_mnemonic_form.dart'
    as _i25;
import 'package:threedpass/features/accounts/presentation/pages/no_stable_hash_dialog.dart'
    as _i32;
import 'package:threedpass/features/compare_page/presentation/pages/compare_page_wrapper.dart'
    as _i3;
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart'
    as _i40;
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart'
    as _i39;
import 'package:threedpass/features/home_page/presentation/home_page.dart'
    as _i14;
import 'package:threedpass/features/home_page/presentation/login_page.dart'
    as _i13;
import 'package:threedpass/features/home_page/router/empty_initial_route.dart'
    as _i36;
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart'
    as _i41;
import 'package:threedpass/features/preview_page/presentation/preview_page.dart'
    as _i5;
import 'package:threedpass/features/preview_page/presentation/preview_page_wrapper.dart'
    as _i4;
import 'package:threedpass/features/preview_page/presentation/widgets/rename_snapshot_dialog.dart'
    as _i6;
import 'package:threedpass/features/preview_page/presentation/widgets/save_hash_dialog.dart'
    as _i7;
import 'package:threedpass/features/preview_page/presentation/widgets/save_object_dialog/save_object_dialog.dart'
    as _i9;
import 'package:threedpass/features/preview_page/presentation/widgets/save_top_hashes_dialog/save_top_hashes_dialog.dart'
    as _i8;
import 'package:threedpass/features/scan_page/presentation/pages/scan_page.dart'
    as _i11;
import 'package:threedpass/features/scan_page/presentation/pages/scan_page_wrapper.dart'
    as _i10;
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart'
    as _i12;
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart'
    as _i45;
import 'package:threedpass/features/settings_page/presentation/settings_page.dart'
    as _i33;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/stable_hash_subpage.dart'
    as _i34;
import 'package:threedpass/features/settings_page/router/empty_settings_route.dart'
    as _i35;
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart'
    as _i42;
import 'package:threedpass/features/wallet_screen/presentation/assets_page/remove_account_dialog.dart'
    as _i15;
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart'
    as _i43;
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/presentation/non_native_token_wrapper.dart'
    as _i21;
import 'package:threedpass/features/wallet_screen/presentation/recieve_page/recieve_page.dart'
    as _i16;
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/presentation/transactions_history_wrapper.dart'
    as _i22;
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/transfer_page.dart'
    as _i20;
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/transfer_page_wrapper.dart'
    as _i19;
import 'package:threedpass/features/wallet_screen/presentation/wallet_page/wallet_page.dart'
    as _i17;
import 'package:threedpass/features/wallet_screen/presentation/wallet_page/wallet_page_wrapper.dart'
    as _i18;

abstract class $RootRouter extends _i37.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i37.PageFactory> pagesMap = {
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ErrorPage(
          error: args.error,
          key: args.key,
        ),
      );
    },
    DefaultLoadingRoute.name: (routeData) {
      final args = routeData.argsAs<DefaultLoadingRouteArgs>(
          orElse: () => const DefaultLoadingRouteArgs());
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DefaultLoadingDialog(
          key: args.key,
          text: args.text,
        ),
      );
    },
    CompareRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<CompareRouteWrapperArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ComparePageWrapper(
          origObj: args.origObj,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    PreviewRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<PreviewRouteWrapperArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.WrappedRoute(
            child: _i4.PreviewPageWrapper(
          hashObject: args.hashObject,
          snapshot: args.snapshot,
          key: args.key,
          createNewAnyway: args.createNewAnyway,
        )),
      );
    },
    PreviewRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PreviewPage(),
      );
    },
    RenameSnapshotRoute.name: (routeData) {
      final args = routeData.argsAs<RenameSnapshotRouteArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RenameSnapshotDialog(
          snapshot: args.snapshot,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    SaveHashRoute.name: (routeData) {
      final args = routeData.argsAs<SaveHashRouteArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SaveHashDialog(
          snapshot: args.snapshot,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    SaveTopHashesRoute.name: (routeData) {
      final args = routeData.argsAs<SaveTopHashesRouteArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SaveTopHashesDialog(
          pageCubitState: args.pageCubitState,
          key: args.key,
        ),
      );
    },
    SaveObjectRoute.name: (routeData) {
      final args = routeData.argsAs<SaveObjectRouteArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SaveObjectDialog(
          snapshot: args.snapshot,
          key: args.key,
        ),
      );
    },
    ScanRouteWrapper.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.WrappedRoute(child: const _i10.ScanPageWrapper()),
      );
    },
    ScanRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ScanPage(),
      );
    },
    CalcHashLoadingRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.CalcHashLoadingDialog(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i37.AutoRoutePage<bool>(
        routeData: routeData,
        child: _i13.LoginPage(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.HomePage(),
      );
    },
    RemoveAccountRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.RemoveAccountDialog(),
      );
    },
    RecieveRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.RecievePage(),
      );
    },
    WalletRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.WalletPage(),
      );
    },
    WalletRouteWrapper.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.WrappedRoute(child: const _i18.WalletPageWrapper()),
      );
    },
    TransferRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<TransferRouteWrapperArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.WrappedRoute(
            child: _i19.TransferPageWrapper(
          metadata: args.metadata,
          key: args.key,
        )),
      );
    },
    TransferRoute.name: (routeData) {
      final args = routeData.argsAs<TransferRouteArgs>(
          orElse: () => const TransferRouteArgs());
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.TransferPage(key: args.key),
      );
    },
    NonNativeTokenRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<NonNativeTokenRouteWrapperArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.NonNativeTokenPageWrapper(
          args.params,
          key: args.key,
        ),
      );
    },
    TransactionsHistoryRouteWrapper.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.TransactionsHistoryPageWrapper(),
      );
    },
    CreateAccountRouteWrapper.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.WrappedRoute(child: const _i23.CreateAccountPageWrapper()),
      );
    },
    CreateAccountFromObjectRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.CreateAccountFromObjectPage(),
      );
    },
    ImportMnemonicFormRoute.name: (routeData) {
      final args = routeData.argsAs<ImportMnemonicFormRouteArgs>(
          orElse: () => const ImportMnemonicFormRouteArgs());
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.ImportMnemonicFormPage(key: args.key),
      );
    },
    CreateAccountInfoRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.CreateAccountInfoPage(),
      );
    },
    CreateAccountMnemonicBackupRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.CreateAccountMnemonicBackupPage(),
      );
    },
    CreateAccountMnemonicConfirmRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.CreateAccountMnemonicConfirmPage(),
      );
    },
    CreateAccountCredentialsRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountCredentialsRouteArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.CreateAccountCredentialsPage(
          appbarText: args.appbarText,
          key: args.key,
        ),
      );
    },
    CreateAccountTypeRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.CreateAccountTypePage(),
      );
    },
    CreateAccountLoaderRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.CreateAccountLoaderPage(),
      );
    },
    NoStableHashRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.NoStableHashDialog(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.SettingsPage(),
      );
    },
    StableHashSubRoute.name: (routeData) {
      final args = routeData.argsAs<StableHashSubRouteArgs>();
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.StableHashSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    SettingsWrapperRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.EmptySettingsRoute(),
      );
    },
    InitialWrapperRoute.name: (routeData) {
      return _i37.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.EmptyInitialRoute(),
      );
    },
  };
}

/// generated route for
/// [_i1.ErrorPage]
class ErrorRoute extends _i37.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    required Object error,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            error: error,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i37.PageInfo<ErrorRouteArgs> page =
      _i37.PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    required this.error,
    this.key,
  });

  final Object error;

  final _i38.Key? key;

  @override
  String toString() {
    return 'ErrorRouteArgs{error: $error, key: $key}';
  }
}

/// generated route for
/// [_i2.DefaultLoadingDialog]
class DefaultLoadingRoute extends _i37.PageRouteInfo<DefaultLoadingRouteArgs> {
  DefaultLoadingRoute({
    _i38.Key? key,
    String? text,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          DefaultLoadingRoute.name,
          args: DefaultLoadingRouteArgs(
            key: key,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'DefaultLoadingRoute';

  static const _i37.PageInfo<DefaultLoadingRouteArgs> page =
      _i37.PageInfo<DefaultLoadingRouteArgs>(name);
}

class DefaultLoadingRouteArgs {
  const DefaultLoadingRouteArgs({
    this.key,
    this.text,
  });

  final _i38.Key? key;

  final String? text;

  @override
  String toString() {
    return 'DefaultLoadingRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [_i3.ComparePageWrapper]
class CompareRouteWrapper extends _i37.PageRouteInfo<CompareRouteWrapperArgs> {
  CompareRouteWrapper({
    required _i39.Snapshot origObj,
    required _i40.HashObject hashObject,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          CompareRouteWrapper.name,
          args: CompareRouteWrapperArgs(
            origObj: origObj,
            hashObject: hashObject,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CompareRouteWrapper';

  static const _i37.PageInfo<CompareRouteWrapperArgs> page =
      _i37.PageInfo<CompareRouteWrapperArgs>(name);
}

class CompareRouteWrapperArgs {
  const CompareRouteWrapperArgs({
    required this.origObj,
    required this.hashObject,
    this.key,
  });

  final _i39.Snapshot origObj;

  final _i40.HashObject hashObject;

  final _i38.Key? key;

  @override
  String toString() {
    return 'CompareRouteWrapperArgs{origObj: $origObj, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i4.PreviewPageWrapper]
class PreviewRouteWrapper extends _i37.PageRouteInfo<PreviewRouteWrapperArgs> {
  PreviewRouteWrapper({
    required _i40.HashObject? hashObject,
    required _i39.Snapshot snapshot,
    _i38.Key? key,
    bool createNewAnyway = false,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          PreviewRouteWrapper.name,
          args: PreviewRouteWrapperArgs(
            hashObject: hashObject,
            snapshot: snapshot,
            key: key,
            createNewAnyway: createNewAnyway,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviewRouteWrapper';

  static const _i37.PageInfo<PreviewRouteWrapperArgs> page =
      _i37.PageInfo<PreviewRouteWrapperArgs>(name);
}

class PreviewRouteWrapperArgs {
  const PreviewRouteWrapperArgs({
    required this.hashObject,
    required this.snapshot,
    this.key,
    this.createNewAnyway = false,
  });

  final _i40.HashObject? hashObject;

  final _i39.Snapshot snapshot;

  final _i38.Key? key;

  final bool createNewAnyway;

  @override
  String toString() {
    return 'PreviewRouteWrapperArgs{hashObject: $hashObject, snapshot: $snapshot, key: $key, createNewAnyway: $createNewAnyway}';
  }
}

/// generated route for
/// [_i5.PreviewPage]
class PreviewRoute extends _i37.PageRouteInfo<void> {
  const PreviewRoute({List<_i37.PageRouteInfo>? children})
      : super(
          PreviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RenameSnapshotDialog]
class RenameSnapshotRoute extends _i37.PageRouteInfo<RenameSnapshotRouteArgs> {
  RenameSnapshotRoute({
    required _i39.Snapshot snapshot,
    required _i40.HashObject hashObject,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          RenameSnapshotRoute.name,
          args: RenameSnapshotRouteArgs(
            snapshot: snapshot,
            hashObject: hashObject,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RenameSnapshotRoute';

  static const _i37.PageInfo<RenameSnapshotRouteArgs> page =
      _i37.PageInfo<RenameSnapshotRouteArgs>(name);
}

class RenameSnapshotRouteArgs {
  const RenameSnapshotRouteArgs({
    required this.snapshot,
    required this.hashObject,
    this.key,
  });

  final _i39.Snapshot snapshot;

  final _i40.HashObject hashObject;

  final _i38.Key? key;

  @override
  String toString() {
    return 'RenameSnapshotRouteArgs{snapshot: $snapshot, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i7.SaveHashDialog]
class SaveHashRoute extends _i37.PageRouteInfo<SaveHashRouteArgs> {
  SaveHashRoute({
    required _i39.Snapshot snapshot,
    required _i40.HashObject hashObject,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          SaveHashRoute.name,
          args: SaveHashRouteArgs(
            snapshot: snapshot,
            hashObject: hashObject,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SaveHashRoute';

  static const _i37.PageInfo<SaveHashRouteArgs> page =
      _i37.PageInfo<SaveHashRouteArgs>(name);
}

class SaveHashRouteArgs {
  const SaveHashRouteArgs({
    required this.snapshot,
    required this.hashObject,
    this.key,
  });

  final _i39.Snapshot snapshot;

  final _i40.HashObject hashObject;

  final _i38.Key? key;

  @override
  String toString() {
    return 'SaveHashRouteArgs{snapshot: $snapshot, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i8.SaveTopHashesDialog]
class SaveTopHashesRoute extends _i37.PageRouteInfo<SaveTopHashesRouteArgs> {
  SaveTopHashesRoute({
    required _i41.PreviewPageCubitState pageCubitState,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          SaveTopHashesRoute.name,
          args: SaveTopHashesRouteArgs(
            pageCubitState: pageCubitState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SaveTopHashesRoute';

  static const _i37.PageInfo<SaveTopHashesRouteArgs> page =
      _i37.PageInfo<SaveTopHashesRouteArgs>(name);
}

class SaveTopHashesRouteArgs {
  const SaveTopHashesRouteArgs({
    required this.pageCubitState,
    this.key,
  });

  final _i41.PreviewPageCubitState pageCubitState;

  final _i38.Key? key;

  @override
  String toString() {
    return 'SaveTopHashesRouteArgs{pageCubitState: $pageCubitState, key: $key}';
  }
}

/// generated route for
/// [_i9.SaveObjectDialog]
class SaveObjectRoute extends _i37.PageRouteInfo<SaveObjectRouteArgs> {
  SaveObjectRoute({
    required _i39.Snapshot snapshot,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          SaveObjectRoute.name,
          args: SaveObjectRouteArgs(
            snapshot: snapshot,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SaveObjectRoute';

  static const _i37.PageInfo<SaveObjectRouteArgs> page =
      _i37.PageInfo<SaveObjectRouteArgs>(name);
}

class SaveObjectRouteArgs {
  const SaveObjectRouteArgs({
    required this.snapshot,
    this.key,
  });

  final _i39.Snapshot snapshot;

  final _i38.Key? key;

  @override
  String toString() {
    return 'SaveObjectRouteArgs{snapshot: $snapshot, key: $key}';
  }
}

/// generated route for
/// [_i10.ScanPageWrapper]
class ScanRouteWrapper extends _i37.PageRouteInfo<void> {
  const ScanRouteWrapper({List<_i37.PageRouteInfo>? children})
      : super(
          ScanRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'ScanRouteWrapper';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ScanPage]
class ScanRoute extends _i37.PageRouteInfo<void> {
  const ScanRoute({List<_i37.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CalcHashLoadingDialog]
class CalcHashLoadingRoute extends _i37.PageRouteInfo<void> {
  const CalcHashLoadingRoute({List<_i37.PageRouteInfo>? children})
      : super(
          CalcHashLoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalcHashLoadingRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i13.LoginPage]
class LoginRoute extends _i37.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i38.Key? key,
    void Function(bool)? onLoginResult,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i37.PageInfo<LoginRouteArgs> page =
      _i37.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onLoginResult,
  });

  final _i38.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i14.HomePage]
class HomeRoute extends _i37.PageRouteInfo<void> {
  const HomeRoute({List<_i37.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RemoveAccountDialog]
class RemoveAccountRoute extends _i37.PageRouteInfo<void> {
  const RemoveAccountRoute({List<_i37.PageRouteInfo>? children})
      : super(
          RemoveAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'RemoveAccountRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i16.RecievePage]
class RecieveRoute extends _i37.PageRouteInfo<void> {
  const RecieveRoute({List<_i37.PageRouteInfo>? children})
      : super(
          RecieveRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecieveRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i17.WalletPage]
class WalletRoute extends _i37.PageRouteInfo<void> {
  const WalletRoute({List<_i37.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i18.WalletPageWrapper]
class WalletRouteWrapper extends _i37.PageRouteInfo<void> {
  const WalletRouteWrapper({List<_i37.PageRouteInfo>? children})
      : super(
          WalletRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'WalletRouteWrapper';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i19.TransferPageWrapper]
class TransferRouteWrapper
    extends _i37.PageRouteInfo<TransferRouteWrapperArgs> {
  TransferRouteWrapper({
    required _i42.TransferMetaDTO metadata,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          TransferRouteWrapper.name,
          args: TransferRouteWrapperArgs(
            metadata: metadata,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransferRouteWrapper';

  static const _i37.PageInfo<TransferRouteWrapperArgs> page =
      _i37.PageInfo<TransferRouteWrapperArgs>(name);
}

class TransferRouteWrapperArgs {
  const TransferRouteWrapperArgs({
    required this.metadata,
    this.key,
  });

  final _i42.TransferMetaDTO metadata;

  final _i38.Key? key;

  @override
  String toString() {
    return 'TransferRouteWrapperArgs{metadata: $metadata, key: $key}';
  }
}

/// generated route for
/// [_i20.TransferPage]
class TransferRoute extends _i37.PageRouteInfo<TransferRouteArgs> {
  TransferRoute({
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          TransferRoute.name,
          args: TransferRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TransferRoute';

  static const _i37.PageInfo<TransferRouteArgs> page =
      _i37.PageInfo<TransferRouteArgs>(name);
}

class TransferRouteArgs {
  const TransferRouteArgs({this.key});

  final _i38.Key? key;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i21.NonNativeTokenPageWrapper]
class NonNativeTokenRouteWrapper
    extends _i37.PageRouteInfo<NonNativeTokenRouteWrapperArgs> {
  NonNativeTokenRouteWrapper({
    required _i43.GetExtrinsicsUseCaseParams params,
    _i44.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          NonNativeTokenRouteWrapper.name,
          args: NonNativeTokenRouteWrapperArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NonNativeTokenRouteWrapper';

  static const _i37.PageInfo<NonNativeTokenRouteWrapperArgs> page =
      _i37.PageInfo<NonNativeTokenRouteWrapperArgs>(name);
}

class NonNativeTokenRouteWrapperArgs {
  const NonNativeTokenRouteWrapperArgs({
    required this.params,
    this.key,
  });

  final _i43.GetExtrinsicsUseCaseParams params;

  final _i44.Key? key;

  @override
  String toString() {
    return 'NonNativeTokenRouteWrapperArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [_i22.TransactionsHistoryPageWrapper]
class TransactionsHistoryRouteWrapper extends _i37.PageRouteInfo<void> {
  const TransactionsHistoryRouteWrapper({List<_i37.PageRouteInfo>? children})
      : super(
          TransactionsHistoryRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsHistoryRouteWrapper';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i23.CreateAccountPageWrapper]
class CreateAccountRouteWrapper extends _i37.PageRouteInfo<void> {
  const CreateAccountRouteWrapper({List<_i37.PageRouteInfo>? children})
      : super(
          CreateAccountRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRouteWrapper';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i24.CreateAccountFromObjectPage]
class CreateAccountFromObjectRoute extends _i37.PageRouteInfo<void> {
  const CreateAccountFromObjectRoute({List<_i37.PageRouteInfo>? children})
      : super(
          CreateAccountFromObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountFromObjectRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ImportMnemonicFormPage]
class ImportMnemonicFormRoute
    extends _i37.PageRouteInfo<ImportMnemonicFormRouteArgs> {
  ImportMnemonicFormRoute({
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          ImportMnemonicFormRoute.name,
          args: ImportMnemonicFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportMnemonicFormRoute';

  static const _i37.PageInfo<ImportMnemonicFormRouteArgs> page =
      _i37.PageInfo<ImportMnemonicFormRouteArgs>(name);
}

class ImportMnemonicFormRouteArgs {
  const ImportMnemonicFormRouteArgs({this.key});

  final _i38.Key? key;

  @override
  String toString() {
    return 'ImportMnemonicFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i26.CreateAccountInfoPage]
class CreateAccountInfoRoute extends _i37.PageRouteInfo<void> {
  const CreateAccountInfoRoute({List<_i37.PageRouteInfo>? children})
      : super(
          CreateAccountInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountInfoRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i27.CreateAccountMnemonicBackupPage]
class CreateAccountMnemonicBackupRoute extends _i37.PageRouteInfo<void> {
  const CreateAccountMnemonicBackupRoute({List<_i37.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicBackupRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicBackupRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i28.CreateAccountMnemonicConfirmPage]
class CreateAccountMnemonicConfirmRoute extends _i37.PageRouteInfo<void> {
  const CreateAccountMnemonicConfirmRoute({List<_i37.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicConfirmRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i29.CreateAccountCredentialsPage]
class CreateAccountCredentialsRoute
    extends _i37.PageRouteInfo<CreateAccountCredentialsRouteArgs> {
  CreateAccountCredentialsRoute({
    required String appbarText,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          CreateAccountCredentialsRoute.name,
          args: CreateAccountCredentialsRouteArgs(
            appbarText: appbarText,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateAccountCredentialsRoute';

  static const _i37.PageInfo<CreateAccountCredentialsRouteArgs> page =
      _i37.PageInfo<CreateAccountCredentialsRouteArgs>(name);
}

class CreateAccountCredentialsRouteArgs {
  const CreateAccountCredentialsRouteArgs({
    required this.appbarText,
    this.key,
  });

  final String appbarText;

  final _i38.Key? key;

  @override
  String toString() {
    return 'CreateAccountCredentialsRouteArgs{appbarText: $appbarText, key: $key}';
  }
}

/// generated route for
/// [_i30.CreateAccountTypePage]
class CreateAccountTypeRoute extends _i37.PageRouteInfo<void> {
  const CreateAccountTypeRoute({List<_i37.PageRouteInfo>? children})
      : super(
          CreateAccountTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountTypeRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i31.CreateAccountLoaderPage]
class CreateAccountLoaderRoute extends _i37.PageRouteInfo<void> {
  const CreateAccountLoaderRoute({List<_i37.PageRouteInfo>? children})
      : super(
          CreateAccountLoaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountLoaderRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i32.NoStableHashDialog]
class NoStableHashRoute extends _i37.PageRouteInfo<void> {
  const NoStableHashRoute({List<_i37.PageRouteInfo>? children})
      : super(
          NoStableHashRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoStableHashRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i33.SettingsPage]
class SettingsRoute extends _i37.PageRouteInfo<void> {
  const SettingsRoute({List<_i37.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i34.StableHashSubPage]
class StableHashSubRoute extends _i37.PageRouteInfo<StableHashSubRouteArgs> {
  StableHashSubRoute({
    required _i45.GlobalSettings initialState,
    _i38.Key? key,
    List<_i37.PageRouteInfo>? children,
  }) : super(
          StableHashSubRoute.name,
          args: StableHashSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StableHashSubRoute';

  static const _i37.PageInfo<StableHashSubRouteArgs> page =
      _i37.PageInfo<StableHashSubRouteArgs>(name);
}

class StableHashSubRouteArgs {
  const StableHashSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i45.GlobalSettings initialState;

  final _i38.Key? key;

  @override
  String toString() {
    return 'StableHashSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i35.EmptySettingsRoute]
class SettingsWrapperRoute extends _i37.PageRouteInfo<void> {
  const SettingsWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(
          SettingsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsWrapperRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}

/// generated route for
/// [_i36.EmptyInitialRoute]
class InitialWrapperRoute extends _i37.PageRouteInfo<void> {
  const InitialWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(
          InitialWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialWrapperRoute';

  static const _i37.PageInfo<void> page = _i37.PageInfo<void>(name);
}
