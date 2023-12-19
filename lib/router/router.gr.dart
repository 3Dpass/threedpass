// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i46;
import 'package:flutter/material.dart' as _i47;
import 'package:flutter/widgets.dart' as _i53;
import 'package:threedpass/core/widgets/default_loading_dialog.dart' as _i2;
import 'package:threedpass/core/widgets/error_page.dart' as _i1;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_credentials.dart'
    as _i22;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_from_object/create_account_from_object.dart'
    as _i17;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_info_page.dart'
    as _i19;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_loader.dart'
    as _i24;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_backup.dart'
    as _i20;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_confirm.dart'
    as _i21;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_type.dart'
    as _i23;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart'
    as _i16;
import 'package:threedpass/features/accounts/presentation/pages/create_account/import_mnemonic_form.dart'
    as _i18;
import 'package:threedpass/features/accounts/presentation/pages/no_stable_hash_dialog.dart'
    as _i25;
import 'package:threedpass/features/compare_page/presentation/pages/compare_page_wrapper.dart'
    as _i14;
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart'
    as _i50;
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart'
    as _i49;
import 'package:threedpass/features/home_page/presentation/home_page.dart'
    as _i15;
import 'package:threedpass/features/home_page/presentation/login_page.dart'
    as _i16;
import 'package:threedpass/features/home_page/router/empty_initial_route.dart'
    as _i17;
import 'package:threedpass/features/poscan_putobject/presentation/d3prpc_page.dart'
    as _i35;
import 'package:threedpass/features/poscan_putobject/presentation/d3rpc_page_wrapper.dart'
    as _i36;
import 'package:threedpass/features/preview_page/presentation/preview_page.dart'
    as _i20;
import 'package:threedpass/features/preview_page/presentation/preview_page_wrapper.dart'
    as _i21;
import 'package:threedpass/features/preview_page/presentation/widgets/delete_snapshot_dialog.dart'
    as _i22;
import 'package:threedpass/features/preview_page/presentation/widgets/rename_snapshot_dialog.dart'
    as _i23;
import 'package:threedpass/features/preview_page/presentation/widgets/save_hash_dialog.dart'
    as _i24;
import 'package:threedpass/features/preview_page/presentation/widgets/save_object_dialog/save_object_dialog.dart'
    as _i25;
import 'package:threedpass/features/scan_page/presentation/pages/scan_page.dart'
    as _i26;
import 'package:threedpass/features/scan_page/presentation/pages/scan_page_wrapper.dart'
    as _i27;
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart'
    as _i28;
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart'
    as _i50;
import 'package:threedpass/features/settings_page/presentation/settings_page.dart'
    as _i26;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/choose_algorithm_subpage.dart'
    as _i32;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/grid_size_subpage.dart'
    as _i29;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/pixel_ratio_subpage.dart'
    as _i30;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/sections_subpage.dart'
    as _i27;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/stable_hash_subpage.dart'
    as _i33;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/trans_bytes_subpage.dart'
    as _i28;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/wallet_node_subpage.dart'
    as _i31;
import 'package:threedpass/features/settings_page/router/empty_settings_route.dart'
    as _i34;
import 'package:threedpass/features/wallet_screen/assets_page/remove_account_dialog.dart'
    as _i37;
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart'
    as _i52;
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/non_native_token_wrapper.dart'
    as _i44;
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/notifications_page.dart'
    as _i39;
import 'package:threedpass/features/wallet_screen/recieve_page/recieve_page.dart'
    as _i38;
import 'package:threedpass/features/wallet_screen/transactions_history/presentation/transactions_history_wrapper.dart'
    as _i45;
import 'package:threedpass/features/wallet_screen/transfer_page/entities/transfer_meta_dto.dart'
    as _i51;
import 'package:threedpass/features/wallet_screen/transfer_page/transfer_page.dart'
    as _i43;
import 'package:threedpass/features/wallet_screen/transfer_page/transfer_page_wrapper.dart'
    as _i42;
import 'package:threedpass/features/wallet_screen/wallet_page/wallet_page.dart'
    as _i40;
import 'package:threedpass/features/wallet_screen/wallet_page/wallet_page_wrapper.dart'
    as _i41;

abstract class $RootRouter extends _i47.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i47.PageFactory> pagesMap = {
    DefaultLoadingRoute.name: (routeData) {
      final args = routeData.argsAs<DefaultLoadingRouteArgs>(
          orElse: () => const DefaultLoadingRouteArgs());
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DefaultLoadingDialog(
          key: args.key,
          text: args.text,
        ),
      );
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ErrorPage(
          error: args.error,
          key: args.key,
        ),
      );
    },
    CreateAccountCredentialsRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountCredentialsRouteArgs>();
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CreateAccountCredentialsPage(
          appbarText: args.appbarText,
          key: args.key,
        ),
      );
    },
    CreateAccountFromObjectRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateAccountFromObjectPage(),
      );
    },
    CreateAccountInfoRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateAccountInfoPage(),
      );
    },
    CreateAccountLoaderRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CreateAccountLoaderPage(),
      );
    },
    CreateAccountMnemonicBackupRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CreateAccountMnemonicBackupPage(),
      );
    },
    CreateAccountMnemonicConfirmRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CreateAccountMnemonicConfirmPage(),
      );
    },
    CreateAccountTypeRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CreateAccountTypePage(),
      );
    },
    CreateAccountRouteWrapper.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i47.WrappedRoute(child: const _i10.CreateAccountPageWrapper()),
      );
    },
    ImportMnemonicFormRoute.name: (routeData) {
      final args = routeData.argsAs<ImportMnemonicFormRouteArgs>(
          orElse: () => const ImportMnemonicFormRouteArgs());
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ImportMnemonicFormPage(key: args.key),
      );
    },
    ImportRawseedFormRoute.name: (routeData) {
      final args = routeData.argsAs<ImportRawseedFormRouteArgs>(
          orElse: () => const ImportRawseedFormRouteArgs());
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ImportRawseedFormPage(key: args.key),
      );
    },
    NoStableHashRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.NoStableHashDialog(),
      );
    },
    CompareRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<CompareRouteWrapperArgs>();
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.ComparePageWrapper(
          origObj: args.origObj,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.HomePage(),
      );
    },
    InitialWrapperRoute.name: (routeData) {
      return _i46.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.EmptyInitialRoute(),
      );
    },
    CreateAccountRouteWrapper.name: (routeData) {
      return _i46.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i46.WrappedRoute(child: const _i16.CreateAccountPageWrapper()),
      );
    },
    ScanRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.CreateAccountFromObjectPage(),
      );
    },
    ScanRouteWrapper.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.ImportMnemonicFormPage(key: args.key),
      );
    },
    CalcHashLoadingRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.CreateAccountInfoPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.SettingsPage(),
      );
    },
    ChooseAlgorithmSubRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.ChooseAlgorithmSubPage(),
      );
    },
    GridSizeSubRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.GridSizeSubPage(),
        child: const _i21.CreateAccountMnemonicConfirmPage(),
      );
    },
    CreateAccountCredentialsRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountCredentialsRouteArgs>();
      return _i46.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.CreateAccountCredentialsPage(
          appbarText: args.appbarText,
          key: args.key,
        ),
      );
    },
    CreateAccountTypeRoute.name: (routeData) {
      return _i46.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.CreateAccountTypePage(),
      );
    },
    PixelRatioSubRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.PixelRatioSubPage(),
      );
    },
    SectionsSubRoute.name: (routeData) {
      final args = routeData.argsAs<SectionsSubRouteArgs>();
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.SectionsSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
      );
    },
    TransferRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<TransferRouteWrapperArgs>();
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i47.WrappedRoute(
            child: _i44.TransferPageWrapper(
          metadata: args.metadata,
          key: args.key,
        )),
      );
    },
    WalletRoute.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i45.WalletPage(),
      );
    },
    WalletRouteWrapper.name: (routeData) {
      return _i47.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i47.WrappedRoute(child: const _i46.WalletPageWrapper()),
    TransferRoute.name: (routeData) {
      final args = routeData.argsAs<TransferRouteArgs>(
          orElse: () => const TransferRouteArgs());
      return _i46.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i43.TransferPage(key: args.key),
      );
    },
    NonNativeTokenRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<NonNativeTokenRouteWrapperArgs>();
      return _i46.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.NonNativeTokenPageWrapper(
          args.params,
          key: args.key,
        ),
      );
    },
    TransactionsHistoryRouteWrapper.name: (routeData) {
      return _i46.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i45.TransactionsHistoryPageWrapper(),
      );
    },
  };
}

/// generated route for
/// [_i1.DefaultLoadingDialog]
class DefaultLoadingRoute extends _i47.PageRouteInfo<DefaultLoadingRouteArgs> {
  DefaultLoadingRoute({
    _i48.Key? key,
    String? text,
    List<_i47.PageRouteInfo>? children,
  }) : super(
          DefaultLoadingRoute.name,
          args: DefaultLoadingRouteArgs(
            key: key,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'DefaultLoadingRoute';

  static const _i47.PageInfo<DefaultLoadingRouteArgs> page =
      _i47.PageInfo<DefaultLoadingRouteArgs>(name);
}

class DefaultLoadingRouteArgs {
  const DefaultLoadingRouteArgs({
    this.key,
    this.text,
  });

  final _i48.Key? key;

  final String? text;

  @override
  String toString() {
    return 'DefaultLoadingRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [_i2.ErrorPage]
class ErrorRoute extends _i47.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    required Object error,
    _i48.Key? key,
    List<_i47.PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            error: error,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i47.PageInfo<ErrorRouteArgs> page =
      _i47.PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    required this.error,
    this.key,
  });

  final Object error;

  final _i48.Key? key;

  @override
  String toString() {
    return 'ErrorRouteArgs{error: $error, key: $key}';
  }
}

/// generated route for
/// [_i3.CreateAccountCredentialsPage]
class CreateAccountCredentialsRoute
    extends _i47.PageRouteInfo<CreateAccountCredentialsRouteArgs> {
  CreateAccountCredentialsRoute({
    required String appbarText,
    _i48.Key? key,
    List<_i47.PageRouteInfo>? children,
  }) : super(
          CreateAccountCredentialsRoute.name,
          args: CreateAccountCredentialsRouteArgs(
            appbarText: appbarText,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateAccountCredentialsRoute';

  static const _i47.PageInfo<CreateAccountCredentialsRouteArgs> page =
      _i47.PageInfo<CreateAccountCredentialsRouteArgs>(name);
}

class CreateAccountCredentialsRouteArgs {
  const CreateAccountCredentialsRouteArgs({
    required this.appbarText,
    this.key,
  });

  final String appbarText;

  final _i48.Key? key;

  @override
  String toString() {
    return 'CreateAccountCredentialsRouteArgs{appbarText: $appbarText, key: $key}';
  }
}

/// generated route for
/// [_i4.CreateAccountFromObjectPage]
class CreateAccountFromObjectRoute extends _i47.PageRouteInfo<void> {
  const CreateAccountFromObjectRoute({List<_i47.PageRouteInfo>? children})
      : super(
          CreateAccountFromObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountFromObjectRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CreateAccountInfoPage]
class CreateAccountInfoRoute extends _i47.PageRouteInfo<void> {
  const CreateAccountInfoRoute({List<_i47.PageRouteInfo>? children})
      : super(
          CreateAccountInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountInfoRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CreateAccountLoaderPage]
class CreateAccountLoaderRoute extends _i47.PageRouteInfo<void> {
  const CreateAccountLoaderRoute({List<_i47.PageRouteInfo>? children})
      : super(
          CreateAccountLoaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountLoaderRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CreateAccountMnemonicBackupPage]
class CreateAccountMnemonicBackupRoute extends _i47.PageRouteInfo<void> {
  const CreateAccountMnemonicBackupRoute({List<_i47.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicBackupRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicBackupRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CreateAccountMnemonicConfirmPage]
class CreateAccountMnemonicConfirmRoute extends _i47.PageRouteInfo<void> {
  const CreateAccountMnemonicConfirmRoute({List<_i47.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicConfirmRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CreateAccountTypePage]
class CreateAccountTypeRoute extends _i47.PageRouteInfo<void> {
  const CreateAccountTypeRoute({List<_i47.PageRouteInfo>? children})
      : super(
          CreateAccountTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountTypeRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CreateAccountPageWrapper]
class CreateAccountRouteWrapper extends _i47.PageRouteInfo<void> {
  const CreateAccountRouteWrapper({List<_i47.PageRouteInfo>? children})
      : super(
          CreateAccountRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRouteWrapper';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ImportMnemonicFormPage]
class ImportMnemonicFormRoute
    extends _i47.PageRouteInfo<ImportMnemonicFormRouteArgs> {
  ImportMnemonicFormRoute({
    _i48.Key? key,
    List<_i47.PageRouteInfo>? children,
  }) : super(
          ImportMnemonicFormRoute.name,
          args: ImportMnemonicFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportMnemonicFormRoute';

  static const _i47.PageInfo<ImportMnemonicFormRouteArgs> page =
      _i47.PageInfo<ImportMnemonicFormRouteArgs>(name);
}

class ImportMnemonicFormRouteArgs {
  const ImportMnemonicFormRouteArgs({this.key});

  final _i48.Key? key;

  @override
  String toString() {
    return 'ImportMnemonicFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.ImportRawseedFormPage]
class ImportRawseedFormRoute
    extends _i47.PageRouteInfo<ImportRawseedFormRouteArgs> {
  ImportRawseedFormRoute({
    _i48.Key? key,
    List<_i47.PageRouteInfo>? children,
  }) : super(
          ImportRawseedFormRoute.name,
          args: ImportRawseedFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportRawseedFormRoute';

  static const _i47.PageInfo<ImportRawseedFormRouteArgs> page =
      _i47.PageInfo<ImportRawseedFormRouteArgs>(name);
}

class ImportRawseedFormRouteArgs {
  const ImportRawseedFormRouteArgs({this.key});

  final _i48.Key? key;

  @override
  String toString() {
    return 'ImportRawseedFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.NoStableHashDialog]
class NoStableHashRoute extends _i47.PageRouteInfo<void> {
  const NoStableHashRoute({List<_i47.PageRouteInfo>? children})
      : super(
          NoStableHashRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoStableHashRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ComparePageWrapper]
class CompareRouteWrapper extends _i47.PageRouteInfo<CompareRouteWrapperArgs> {
  CompareRouteWrapper({
    required _i49.Snapshot origObj,
    required _i50.HashObject hashObject,
    _i48.Key? key,
    List<_i47.PageRouteInfo>? children,
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

  static const _i47.PageInfo<CompareRouteWrapperArgs> page =
      _i47.PageInfo<CompareRouteWrapperArgs>(name);
}

class CompareRouteWrapperArgs {
  const CompareRouteWrapperArgs({
    required this.origObj,
    required this.hashObject,
    this.key,
  });

  final _i49.Snapshot origObj;

  final _i50.HashObject hashObject;

  final _i48.Key? key;

  @override
  String toString() {
    return 'CompareRouteWrapperArgs{origObj: $origObj, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i15.HomePage]
class HomeRoute extends _i47.PageRouteInfo<void> {
  const HomeRoute({List<_i47.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i16.LoginPage]
class LoginRoute extends _i47.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i48.Key? key,
    void Function(bool)? onLoginResult,
    List<_i47.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i47.PageInfo<LoginRouteArgs> page =
      _i47.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onLoginResult,
  });

  final _i48.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i17.EmptyInitialRoute]
class InitialWrapperRoute extends _i47.PageRouteInfo<void> {
  const InitialWrapperRoute({List<_i47.PageRouteInfo>? children})
      : super(
          InitialWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialWrapperRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i18.D3PRPCPage]
class D3PRPCRoute extends _i47.PageRouteInfo<void> {
  const D3PRPCRoute({List<_i47.PageRouteInfo>? children})
      : super(
          D3PRPCRoute.name,
          initialChildren: children,
        );

  static const String name = 'D3PRPCRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i19.D3PRPCPageWrapper]
class D3PRPCRouteWrapper extends _i47.PageRouteInfo<void> {
  const D3PRPCRouteWrapper({List<_i47.PageRouteInfo>? children})
      : super(
          D3PRPCRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'D3PRPCRouteWrapper';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PreviewPage]
class PreviewRoute extends _i47.PageRouteInfo<void> {
  const PreviewRoute({List<_i47.PageRouteInfo>? children})
      : super(
          PreviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ImportMnemonicFormPage]
class ImportMnemonicFormRoute
    extends _i46.PageRouteInfo<ImportMnemonicFormRouteArgs> {
  ImportMnemonicFormRoute({
    _i47.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
          ImportMnemonicFormRoute.name,
          args: ImportMnemonicFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportMnemonicFormRoute';

  static const _i46.PageInfo<ImportMnemonicFormRouteArgs> page =
      _i46.PageInfo<ImportMnemonicFormRouteArgs>(name);
}

class ImportMnemonicFormRouteArgs {
  const ImportMnemonicFormRouteArgs({this.key});

  final _i47.Key? key;

  @override
  String toString() {
    return 'ImportMnemonicFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i19.CreateAccountInfoPage]
class CreateAccountInfoRoute extends _i46.PageRouteInfo<void> {
  const CreateAccountInfoRoute({List<_i46.PageRouteInfo>? children})
      : super(
          CreateAccountInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountInfoRoute';

  static const _i47.PageInfo<PreviewRouteWrapperArgs> page =
      _i47.PageInfo<PreviewRouteWrapperArgs>(name);
}

/// generated route for
/// [_i20.CreateAccountMnemonicBackupPage]
class CreateAccountMnemonicBackupRoute extends _i46.PageRouteInfo<void> {
  const CreateAccountMnemonicBackupRoute({List<_i46.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicBackupRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicBackupRoute';

  final _i49.Snapshot snapshot;

  final _i48.Key? key;

  final bool createNewAnyway;

  @override
  String toString() {
    return 'PreviewRouteWrapperArgs{hashObject: $hashObject, snapshot: $snapshot, key: $key, createNewAnyway: $createNewAnyway}';
  }
}

/// [_i21.CreateAccountMnemonicConfirmPage]
class CreateAccountMnemonicConfirmRoute extends _i46.PageRouteInfo<void> {
  const CreateAccountMnemonicConfirmRoute({List<_i46.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicConfirmRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}


class SectionsSubRouteArgs {
  const SectionsSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i51.GlobalSettings initialState;

  final _i48.Key? key;

  @override
  String toString() {
    return 'SectionsSubRouteArgs{initialState: $initialState, key: $key}';
  }
}


class StableHashSubRouteArgs {
  const StableHashSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i51.GlobalSettings initialState;

  final _i48.Key? key;

  @override
  String toString() {
    return 'StableHashSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i35.TransBytesSubPage]
class TransBytesSubRoute extends _i47.PageRouteInfo<TransBytesSubRouteArgs> {
  TransBytesSubRoute({
    required _i51.GlobalSettings initialState,
    _i48.Key? key,
    List<_i47.PageRouteInfo>? children,
  }) : super(
          TransBytesSubRoute.name,
          args: TransBytesSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransBytesSubRoute';

  static const _i47.PageInfo<TransBytesSubRouteArgs> page =
      _i47.PageInfo<TransBytesSubRouteArgs>(name);
}

class TransBytesSubRouteArgs {
  const TransBytesSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i51.GlobalSettings initialState;

  final _i48.Key? key;

  @override
  String toString() {
    return 'TransBytesSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// [_i28.TransBytesSubPage]
class TransBytesSubRoute extends _i46.PageRouteInfo<TransBytesSubRouteArgs> {
  TransBytesSubRoute({
    required _i50.GlobalSettings initialState,
    _i47.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
          WalletNodeSubRoute.name,
          args: WalletNodeSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WalletNodeSubRoute';

  static const _i47.PageInfo<WalletNodeSubRouteArgs> page =
      _i47.PageInfo<WalletNodeSubRouteArgs>(name);
}

class WalletNodeSubRouteArgs {
  const WalletNodeSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i50.GlobalSettings initialState;

  final _i48.Key? key;

  @override
  String toString() {
    return 'WalletNodeSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i29.GridSizeSubPage]
class GridSizeSubRoute extends _i46.PageRouteInfo<void> {
  const GridSizeSubRoute({List<_i46.PageRouteInfo>? children})
      : super(
          SettingsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsWrapperRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i30.PixelRatioSubPage]
class PixelRatioSubRoute extends _i46.PageRouteInfo<void> {
  const PixelRatioSubRoute({List<_i46.PageRouteInfo>? children})
      : super(
          RemoveAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'RemoveAccountRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i31.WalletNodeSubPage]
class WalletNodeSubRoute extends _i46.PageRouteInfo<WalletNodeSubRouteArgs> {
  WalletNodeSubRoute({
    required _i50.GlobalSettings initialState,
    _i47.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
          NonNativeTokenRouteWrapper.name,
          args: NonNativeTokenRouteWrapperArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NonNativeTokenRouteWrapper';

  static const _i47.PageInfo<NonNativeTokenRouteWrapperArgs> page =
      _i47.PageInfo<NonNativeTokenRouteWrapperArgs>(name);
}

class NonNativeTokenRouteWrapperArgs {
  const NonNativeTokenRouteWrapperArgs({
    required this.params,
    this.key,
  });

  final _i52.GetExtrinsicsUseCaseParams params;

  final _i53.Key? key;

  @override
  String toString() {
    return 'NonNativeTokenRouteWrapperArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [_i32.ChooseAlgorithmSubPage]
class ChooseAlgorithmSubRoute extends _i46.PageRouteInfo<void> {
  const ChooseAlgorithmSubRoute({List<_i46.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i33.StableHashSubPage]
class StableHashSubRoute extends _i46.PageRouteInfo<StableHashSubRouteArgs> {
  StableHashSubRoute({
    required _i50.GlobalSettings initialState,
    _i47.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
          StableHashSubRoute.name,
          args: StableHashSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RecieveRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i42.TransactionsHistoryPageWrapper]
class TransactionsHistoryRouteWrapper extends _i47.PageRouteInfo<void> {
  const TransactionsHistoryRouteWrapper({List<_i47.PageRouteInfo>? children})
      : super(
          TransactionsHistoryRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsHistoryRouteWrapper';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i43.TransferPage]
class TransferRoute extends _i47.PageRouteInfo<TransferRouteArgs> {
  TransferRoute({
    _i48.Key? key,
    List<_i47.PageRouteInfo>? children,
  }) : super(
          TransferRoute.name,
          args: TransferRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TransferRoute';

  static const _i47.PageInfo<TransferRouteArgs> page =
      _i47.PageInfo<TransferRouteArgs>(name);
}

class TransferRouteArgs {
  const TransferRouteArgs({this.key});

  final _i48.Key? key;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i34.EmptySettingsRoute]
class SettingsWrapperRoute extends _i46.PageRouteInfo<void> {
  const SettingsWrapperRoute({List<_i46.PageRouteInfo>? children})
      : super(
          SettingsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransferRouteWrapper';

  static const _i47.PageInfo<TransferRouteWrapperArgs> page =
      _i47.PageInfo<TransferRouteWrapperArgs>(name);
}

class TransferRouteWrapperArgs {
  const TransferRouteWrapperArgs({
    required this.metadata,
    this.key,
  });

  final _i54.TransferMetaDTO metadata;

  final _i48.Key? key;

  @override
  String toString() {
    return 'TransferRouteWrapperArgs{metadata: $metadata, key: $key}';
  }
}

/// generated route for
/// [_i35.D3PRPCPage]
class D3PRPCRoute extends _i46.PageRouteInfo<void> {
  const D3PRPCRoute({List<_i46.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i36.D3PRPCPageWrapper]
class D3PRPCRouteWrapper extends _i46.PageRouteInfo<void> {
  const D3PRPCRouteWrapper({List<_i46.PageRouteInfo>? children})
      : super(
          WalletRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'WalletRouteWrapper';

  static const _i47.PageInfo<void> page = _i47.PageInfo<void>(name);
}

/// generated route for
/// [_i37.RemoveAccountDialog]
class RemoveAccountRoute extends _i46.PageRouteInfo<void> {
  const RemoveAccountRoute({List<_i46.PageRouteInfo>? children})
      : super(
          RemoveAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'RemoveAccountRoute';

  static const _i46.PageInfo<void> page = _i46.PageInfo<void>(name);
}

/// generated route for
/// [_i38.RecievePage]
class RecieveRoute extends _i46.PageRouteInfo<void> {
  const RecieveRoute({List<_i46.PageRouteInfo>? children})
      : super(
          RecieveRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecieveRoute';

  static const _i46.PageInfo<void> page = _i46.PageInfo<void>(name);
}

/// generated route for
/// [_i39.NotificationsPage]
class NotificationsRoute extends _i46.PageRouteInfo<void> {
  const NotificationsRoute({List<_i46.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i46.PageInfo<void> page = _i46.PageInfo<void>(name);
}

/// generated route for
/// [_i40.WalletPage]
class WalletRoute extends _i46.PageRouteInfo<void> {
  const WalletRoute({List<_i46.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i46.PageInfo<void> page = _i46.PageInfo<void>(name);
}

/// generated route for
/// [_i41.WalletPageWrapper]
class WalletRouteWrapper extends _i46.PageRouteInfo<void> {
  const WalletRouteWrapper({List<_i46.PageRouteInfo>? children})
      : super(
          WalletRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'WalletRouteWrapper';

  static const _i46.PageInfo<void> page = _i46.PageInfo<void>(name);
}

/// generated route for
/// [_i42.TransferPageWrapper]
class TransferRouteWrapper
    extends _i46.PageRouteInfo<TransferRouteWrapperArgs> {
  TransferRouteWrapper({
    required _i51.TransferMetaDTO metadata,
    _i47.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
          TransferRouteWrapper.name,
          args: TransferRouteWrapperArgs(
            metadata: metadata,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransferRouteWrapper';

  static const _i46.PageInfo<TransferRouteWrapperArgs> page =
      _i46.PageInfo<TransferRouteWrapperArgs>(name);
}

class TransferRouteWrapperArgs {
  const TransferRouteWrapperArgs({
    required this.metadata,
    this.key,
  });

  final _i51.TransferMetaDTO metadata;

  final _i47.Key? key;

  @override
  String toString() {
    return 'TransferRouteWrapperArgs{metadata: $metadata, key: $key}';
  }
}

/// generated route for
/// [_i43.TransferPage]
class TransferRoute extends _i46.PageRouteInfo<TransferRouteArgs> {
  TransferRoute({
    _i47.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
          TransferRoute.name,
          args: TransferRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TransferRoute';

  static const _i46.PageInfo<TransferRouteArgs> page =
      _i46.PageInfo<TransferRouteArgs>(name);
}

class TransferRouteArgs {
  const TransferRouteArgs({this.key});

  final _i47.Key? key;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i44.NonNativeTokenPageWrapper]
class NonNativeTokenRouteWrapper
    extends _i46.PageRouteInfo<NonNativeTokenRouteWrapperArgs> {
  NonNativeTokenRouteWrapper({
    required _i52.GetExtrinsicsUseCaseParams params,
    _i53.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
          NonNativeTokenRouteWrapper.name,
          args: NonNativeTokenRouteWrapperArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NonNativeTokenRouteWrapper';

  static const _i46.PageInfo<NonNativeTokenRouteWrapperArgs> page =
      _i46.PageInfo<NonNativeTokenRouteWrapperArgs>(name);
}

class NonNativeTokenRouteWrapperArgs {
  const NonNativeTokenRouteWrapperArgs({
    required this.params,
    this.key,
  });

  final _i52.GetExtrinsicsUseCaseParams params;

  final _i53.Key? key;

  @override
  String toString() {
    return 'NonNativeTokenRouteWrapperArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [_i45.TransactionsHistoryPageWrapper]
class TransactionsHistoryRouteWrapper extends _i46.PageRouteInfo<void> {
  const TransactionsHistoryRouteWrapper({List<_i46.PageRouteInfo>? children})
      : super(
          TransactionsHistoryRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsHistoryRouteWrapper';

  static const _i46.PageInfo<void> page = _i46.PageInfo<void>(name);
}
