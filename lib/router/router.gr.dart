// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i55;
import 'package:flutter/material.dart' as _i56;
import 'package:flutter/widgets.dart' as _i62;
import 'package:threedpass/core/widgets/default_loading_dialog.dart' as _i2;
import 'package:threedpass/core/widgets/error_page.dart' as _i1;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_credentials.dart'
    as _i38;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_from_object/create_account_from_object.dart'
    as _i33;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_info_page.dart'
    as _i35;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_loader.dart'
    as _i40;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_backup.dart'
    as _i36;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_confirm.dart'
    as _i37;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_type.dart'
    as _i39;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart'
    as _i32;
import 'package:threedpass/features/accounts/presentation/pages/create_account/import_mnemonic_form.dart'
    as _i34;
import 'package:threedpass/features/accounts/presentation/pages/create_account/import_rawseed_form.dart'
    as _i31;
import 'package:threedpass/features/accounts/presentation/pages/no_stable_hash_dialog.dart'
    as _i41;
import 'package:threedpass/features/compare_page/presentation/pages/compare_page_wrapper.dart'
    as _i3;
import 'package:threedpass/features/explorer_page/explorer_page_wrapper.dart'
    as _i18;
import 'package:threedpass/features/explorer_page/objects_list_page/objects_list_page.dart'
    as _i17;
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart'
    as _i58;
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart'
    as _i57;
import 'package:threedpass/features/home_page/presentation/home_page.dart'
    as _i13;
import 'package:threedpass/features/home_page/presentation/login_page.dart'
    as _i12;
import 'package:threedpass/features/home_page/router/empty_initial_route.dart'
    as _i14;
import 'package:threedpass/features/poscan_assets/create_assset/create_asset_page.dart'
    as _i53;
import 'package:threedpass/features/poscan_assets/create_assset/create_asset_page_wrapper.dart'
    as _i54;
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart'
    as _i63;
import 'package:threedpass/features/poscan_putobject/presentation/d3prpc_page.dart'
    as _i15;
import 'package:threedpass/features/poscan_putobject/presentation/d3rpc_page_wrapper.dart'
    as _i16;
import 'package:threedpass/features/preview_page/presentation/preview_page.dart'
    as _i5;
import 'package:threedpass/features/preview_page/presentation/preview_page_wrapper.dart'
    as _i4;
import 'package:threedpass/features/preview_page/presentation/widgets/delete_snapshot_dialog.dart'
    as _i8;
import 'package:threedpass/features/preview_page/presentation/widgets/rename_object_dialog.dart'
    as _i52;
import 'package:threedpass/features/preview_page/presentation/widgets/rename_snapshot_dialog.dart'
    as _i6;
import 'package:threedpass/features/preview_page/presentation/widgets/save_hash_dialog.dart'
    as _i7;
import 'package:threedpass/features/preview_page/presentation/widgets/save_object_dialog/save_object_dialog.dart'
    as _i9;
import 'package:threedpass/features/scan_page/presentation/scan_page.dart'
    as _i11;
import 'package:threedpass/features/scan_page/presentation/scan_page_wrapper.dart'
    as _i10;
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart'
    as _i64;
import 'package:threedpass/features/settings_page/presentation/settings_page.dart'
    as _i43;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/choose_algorithm_subpage.dart'
    as _i49;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/grid_size_subpage.dart'
    as _i46;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/pixel_ratio_subpage.dart'
    as _i47;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/sections_subpage.dart'
    as _i44;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/stable_hash_subpage.dart'
    as _i50;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/trans_bytes_subpage.dart'
    as _i45;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/wallet_node_subpage.dart'
    as _i48;
import 'package:threedpass/features/settings_page/router/empty_settings_route.dart'
    as _i51;
import 'package:threedpass/features/uploaded_object_page/uploaded_object_page.dart'
    as _i42;
import 'package:threedpass/features/wallet_screen/add_contact_page/add_contact_page.dart'
    as _i24;
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart'
    as _i59;
import 'package:threedpass/features/wallet_screen/assets_page/remove_account_dialog.dart'
    as _i21;
import 'package:threedpass/features/wallet_screen/contacts_page/contacts_page.dart'
    as _i19;
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/delete_contact_dialog.dart'
    as _i20;
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart'
    as _i61;
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/non_native_token_wrapper.dart'
    as _i29;
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/notifications_page.dart'
    as _i23;
import 'package:threedpass/features/wallet_screen/recieve_page/recieve_page.dart'
    as _i22;
import 'package:threedpass/features/wallet_screen/transactions_history/presentation/transactions_history_wrapper.dart'
    as _i30;
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart'
    as _i60;
import 'package:threedpass/features/wallet_screen/transfer_page/transfer_page.dart'
    as _i28;
import 'package:threedpass/features/wallet_screen/transfer_page/transfer_page_wrapper.dart'
    as _i27;
import 'package:threedpass/features/wallet_screen/wallet_page/wallet_page.dart'
    as _i25;
import 'package:threedpass/features/wallet_screen/wallet_page/wallet_page_wrapper.dart'
    as _i26;

abstract class $RootRouter extends _i55.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i55.PageFactory> pagesMap = {
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
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
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DefaultLoadingDialog(
          key: args.key,
          text: args.text,
        ),
      );
    },
    CompareRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<CompareRouteWrapperArgs>();
      return _i55.AutoRoutePage<dynamic>(
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
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.WrappedRoute(
            child: _i4.PreviewPageWrapper(
          hashObject: args.hashObject,
          snapshot: args.snapshot,
          key: args.key,
          createNewAnyway: args.createNewAnyway,
        )),
      );
    },
    PreviewRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PreviewPage(),
      );
    },
    RenameSnapshotRoute.name: (routeData) {
      final args = routeData.argsAs<RenameSnapshotRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
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
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SaveHashDialog(
          snapshot: args.snapshot,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    DeleteSnapshotRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.DeleteSnapshotDialog(),
      );
    },
    SaveObjectRoute.name: (routeData) {
      final args = routeData.argsAs<SaveObjectRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SaveObjectDialog(
          snapshot: args.snapshot,
          key: args.key,
        ),
      );
    },
    ScanRouteWrapper.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.WrappedRoute(child: const _i10.ScanPageWrapper()),
      );
    },
    ScanRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ScanPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i55.AutoRoutePage<bool>(
        routeData: routeData,
        child: _i12.LoginPage(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.HomePage(),
      );
    },
    InitialWrapperRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.EmptyInitialRoute(),
      );
    },
    D3PRPCRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.D3PRPCPage(),
      );
    },
    D3PRPCRouteWrapper.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.WrappedRoute(child: const _i16.D3PRPCPageWrapper()),
      );
    },
    ObjectsListRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ObjectsListPage(),
      );
    },
    ExplorerRouteWrapper.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.WrappedRoute(child: const _i18.ExplorerPageWrapper()),
      );
    },
    ContactsRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ContactsPage(),
      );
    },
    DeleteContactRoute.name: (routeData) {
      final args = routeData.argsAs<DeleteContactRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.DeleteContactDialog(
          contact: args.contact,
          key: args.key,
        ),
      );
    },
    RemoveAccountRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.RemoveAccountDialog(),
      );
    },
    RecieveRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.RecievePage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.NotificationsPage(),
      );
    },
    AddContactRoute.name: (routeData) {
      final args = routeData.argsAs<AddContactRouteArgs>(
          orElse: () => const AddContactRouteArgs());
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.AddContactPage(key: args.key),
      );
    },
    WalletRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.WalletPage(),
      );
    },
    WalletRouteWrapper.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.WrappedRoute(child: const _i26.WalletPageWrapper()),
      );
    },
    TransferRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<TransferRouteWrapperArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.WrappedRoute(
            child: _i27.TransferPageWrapper(
          metadata: args.metadata,
          key: args.key,
        )),
      );
    },
    TransferRoute.name: (routeData) {
      final args = routeData.argsAs<TransferRouteArgs>(
          orElse: () => const TransferRouteArgs());
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.TransferPage(key: args.key),
      );
    },
    NonNativeTokenRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<NonNativeTokenRouteWrapperArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.NonNativeTokenPageWrapper(
          args.params,
          key: args.key,
        ),
      );
    },
    TransactionsHistoryRouteWrapper.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.TransactionsHistoryPageWrapper(),
      );
    },
    ImportRawseedFormRoute.name: (routeData) {
      final args = routeData.argsAs<ImportRawseedFormRouteArgs>(
          orElse: () => const ImportRawseedFormRouteArgs());
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.ImportRawseedFormPage(key: args.key),
      );
    },
    CreateAccountRouteWrapper.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.WrappedRoute(child: const _i32.CreateAccountPageWrapper()),
      );
    },
    CreateAccountFromObjectRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.CreateAccountFromObjectPage(),
      );
    },
    ImportMnemonicFormRoute.name: (routeData) {
      final args = routeData.argsAs<ImportMnemonicFormRouteArgs>(
          orElse: () => const ImportMnemonicFormRouteArgs());
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.ImportMnemonicFormPage(key: args.key),
      );
    },
    CreateAccountInfoRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.CreateAccountInfoPage(),
      );
    },
    CreateAccountMnemonicBackupRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.CreateAccountMnemonicBackupPage(),
      );
    },
    CreateAccountMnemonicConfirmRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i37.CreateAccountMnemonicConfirmPage(),
      );
    },
    CreateAccountCredentialsRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountCredentialsRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i38.CreateAccountCredentialsPage(
          appbarText: args.appbarText,
          key: args.key,
        ),
      );
    },
    CreateAccountTypeRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i39.CreateAccountTypePage(),
      );
    },
    CreateAccountLoaderRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.CreateAccountLoaderPage(),
      );
    },
    NoStableHashRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.NoStableHashDialog(),
      );
    },
    UploadedObjectRoute.name: (routeData) {
      final args = routeData.argsAs<UploadedObjectRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i42.UploadedObjectPage(
          uploadedObject: args.uploadedObject,
          key: args.key,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i43.SettingsPage(),
      );
    },
    SectionsSubRoute.name: (routeData) {
      final args = routeData.argsAs<SectionsSubRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.SectionsSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    TransBytesSubRoute.name: (routeData) {
      final args = routeData.argsAs<TransBytesSubRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i45.TransBytesSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    GridSizeSubRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.GridSizeSubPage(),
      );
    },
    PixelRatioSubRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i47.PixelRatioSubPage(),
      );
    },
    WalletNodeSubRoute.name: (routeData) {
      final args = routeData.argsAs<WalletNodeSubRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i48.WalletNodeSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    ChooseAlgorithmSubRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i49.ChooseAlgorithmSubPage(),
      );
    },
    StableHashSubRoute.name: (routeData) {
      final args = routeData.argsAs<StableHashSubRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i50.StableHashSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    SettingsWrapperRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i51.EmptySettingsRoute(),
      );
    },
    RenameObjectRoute.name: (routeData) {
      final args = routeData.argsAs<RenameObjectRouteArgs>();
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i52.RenameObjectDialog(
          snapshot: args.snapshot,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    CreateAssetRoute.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i53.CreateAssetPage(),
      );
    },
    CreateAssetRouteWrapper.name: (routeData) {
      return _i55.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.WrappedRoute(child: const _i54.CreateAssetPageWrapper()),
      );
    },
  };
}

/// generated route for
/// [_i1.ErrorPage]
class ErrorRoute extends _i55.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    required Object error,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            error: error,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i55.PageInfo<ErrorRouteArgs> page =
      _i55.PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    required this.error,
    this.key,
  });

  final Object error;

  final _i56.Key? key;

  @override
  String toString() {
    return 'ErrorRouteArgs{error: $error, key: $key}';
  }
}

/// generated route for
/// [_i2.DefaultLoadingDialog]
class DefaultLoadingRoute extends _i55.PageRouteInfo<DefaultLoadingRouteArgs> {
  DefaultLoadingRoute({
    _i56.Key? key,
    String? text,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          DefaultLoadingRoute.name,
          args: DefaultLoadingRouteArgs(
            key: key,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'DefaultLoadingRoute';

  static const _i55.PageInfo<DefaultLoadingRouteArgs> page =
      _i55.PageInfo<DefaultLoadingRouteArgs>(name);
}

class DefaultLoadingRouteArgs {
  const DefaultLoadingRouteArgs({
    this.key,
    this.text,
  });

  final _i56.Key? key;

  final String? text;

  @override
  String toString() {
    return 'DefaultLoadingRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [_i3.ComparePageWrapper]
class CompareRouteWrapper extends _i55.PageRouteInfo<CompareRouteWrapperArgs> {
  CompareRouteWrapper({
    required _i57.Snapshot origObj,
    required _i58.HashObject hashObject,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
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

  static const _i55.PageInfo<CompareRouteWrapperArgs> page =
      _i55.PageInfo<CompareRouteWrapperArgs>(name);
}

class CompareRouteWrapperArgs {
  const CompareRouteWrapperArgs({
    required this.origObj,
    required this.hashObject,
    this.key,
  });

  final _i57.Snapshot origObj;

  final _i58.HashObject hashObject;

  final _i56.Key? key;

  @override
  String toString() {
    return 'CompareRouteWrapperArgs{origObj: $origObj, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i4.PreviewPageWrapper]
class PreviewRouteWrapper extends _i55.PageRouteInfo<PreviewRouteWrapperArgs> {
  PreviewRouteWrapper({
    required _i58.HashObject? hashObject,
    required _i57.Snapshot snapshot,
    _i56.Key? key,
    bool createNewAnyway = false,
    List<_i55.PageRouteInfo>? children,
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

  static const _i55.PageInfo<PreviewRouteWrapperArgs> page =
      _i55.PageInfo<PreviewRouteWrapperArgs>(name);
}

class PreviewRouteWrapperArgs {
  const PreviewRouteWrapperArgs({
    required this.hashObject,
    required this.snapshot,
    this.key,
    this.createNewAnyway = false,
  });

  final _i58.HashObject? hashObject;

  final _i57.Snapshot snapshot;

  final _i56.Key? key;

  final bool createNewAnyway;

  @override
  String toString() {
    return 'PreviewRouteWrapperArgs{hashObject: $hashObject, snapshot: $snapshot, key: $key, createNewAnyway: $createNewAnyway}';
  }
}

/// generated route for
/// [_i5.PreviewPage]
class PreviewRoute extends _i55.PageRouteInfo<void> {
  const PreviewRoute({List<_i55.PageRouteInfo>? children})
      : super(
          PreviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RenameSnapshotDialog]
class RenameSnapshotRoute extends _i55.PageRouteInfo<RenameSnapshotRouteArgs> {
  RenameSnapshotRoute({
    required _i57.Snapshot snapshot,
    required _i58.HashObject hashObject,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
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

  static const _i55.PageInfo<RenameSnapshotRouteArgs> page =
      _i55.PageInfo<RenameSnapshotRouteArgs>(name);
}

class RenameSnapshotRouteArgs {
  const RenameSnapshotRouteArgs({
    required this.snapshot,
    required this.hashObject,
    this.key,
  });

  final _i57.Snapshot snapshot;

  final _i58.HashObject hashObject;

  final _i56.Key? key;

  @override
  String toString() {
    return 'RenameSnapshotRouteArgs{snapshot: $snapshot, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i7.SaveHashDialog]
class SaveHashRoute extends _i55.PageRouteInfo<SaveHashRouteArgs> {
  SaveHashRoute({
    required _i57.Snapshot snapshot,
    required _i58.HashObject hashObject,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
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

  static const _i55.PageInfo<SaveHashRouteArgs> page =
      _i55.PageInfo<SaveHashRouteArgs>(name);
}

class SaveHashRouteArgs {
  const SaveHashRouteArgs({
    required this.snapshot,
    required this.hashObject,
    this.key,
  });

  final _i57.Snapshot snapshot;

  final _i58.HashObject hashObject;

  final _i56.Key? key;

  @override
  String toString() {
    return 'SaveHashRouteArgs{snapshot: $snapshot, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i8.DeleteSnapshotDialog]
class DeleteSnapshotRoute extends _i55.PageRouteInfo<void> {
  const DeleteSnapshotRoute({List<_i55.PageRouteInfo>? children})
      : super(
          DeleteSnapshotRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeleteSnapshotRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SaveObjectDialog]
class SaveObjectRoute extends _i55.PageRouteInfo<SaveObjectRouteArgs> {
  SaveObjectRoute({
    required _i57.Snapshot snapshot,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          SaveObjectRoute.name,
          args: SaveObjectRouteArgs(
            snapshot: snapshot,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SaveObjectRoute';

  static const _i55.PageInfo<SaveObjectRouteArgs> page =
      _i55.PageInfo<SaveObjectRouteArgs>(name);
}

class SaveObjectRouteArgs {
  const SaveObjectRouteArgs({
    required this.snapshot,
    this.key,
  });

  final _i57.Snapshot snapshot;

  final _i56.Key? key;

  @override
  String toString() {
    return 'SaveObjectRouteArgs{snapshot: $snapshot, key: $key}';
  }
}

/// generated route for
/// [_i10.ScanPageWrapper]
class ScanRouteWrapper extends _i55.PageRouteInfo<void> {
  const ScanRouteWrapper({List<_i55.PageRouteInfo>? children})
      : super(
          ScanRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'ScanRouteWrapper';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ScanPage]
class ScanRoute extends _i55.PageRouteInfo<void> {
  const ScanRoute({List<_i55.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LoginPage]
class LoginRoute extends _i55.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i56.Key? key,
    void Function(bool)? onLoginResult,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i55.PageInfo<LoginRouteArgs> page =
      _i55.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onLoginResult,
  });

  final _i56.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i13.HomePage]
class HomeRoute extends _i55.PageRouteInfo<void> {
  const HomeRoute({List<_i55.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i14.EmptyInitialRoute]
class InitialWrapperRoute extends _i55.PageRouteInfo<void> {
  const InitialWrapperRoute({List<_i55.PageRouteInfo>? children})
      : super(
          InitialWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialWrapperRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i15.D3PRPCPage]
class D3PRPCRoute extends _i55.PageRouteInfo<void> {
  const D3PRPCRoute({List<_i55.PageRouteInfo>? children})
      : super(
          D3PRPCRoute.name,
          initialChildren: children,
        );

  static const String name = 'D3PRPCRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i16.D3PRPCPageWrapper]
class D3PRPCRouteWrapper extends _i55.PageRouteInfo<void> {
  const D3PRPCRouteWrapper({List<_i55.PageRouteInfo>? children})
      : super(
          D3PRPCRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'D3PRPCRouteWrapper';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ObjectsListPage]
class ObjectsListRoute extends _i55.PageRouteInfo<void> {
  const ObjectsListRoute({List<_i55.PageRouteInfo>? children})
      : super(
          ObjectsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ObjectsListRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ExplorerPageWrapper]
class ExplorerRouteWrapper extends _i55.PageRouteInfo<void> {
  const ExplorerRouteWrapper({List<_i55.PageRouteInfo>? children})
      : super(
          ExplorerRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'ExplorerRouteWrapper';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ContactsPage]
class ContactsRoute extends _i55.PageRouteInfo<void> {
  const ContactsRoute({List<_i55.PageRouteInfo>? children})
      : super(
          ContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i20.DeleteContactDialog]
class DeleteContactRoute extends _i55.PageRouteInfo<DeleteContactRouteArgs> {
  DeleteContactRoute({
    required _i59.Contact contact,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          DeleteContactRoute.name,
          args: DeleteContactRouteArgs(
            contact: contact,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DeleteContactRoute';

  static const _i55.PageInfo<DeleteContactRouteArgs> page =
      _i55.PageInfo<DeleteContactRouteArgs>(name);
}

class DeleteContactRouteArgs {
  const DeleteContactRouteArgs({
    required this.contact,
    this.key,
  });

  final _i59.Contact contact;

  final _i56.Key? key;

  @override
  String toString() {
    return 'DeleteContactRouteArgs{contact: $contact, key: $key}';
  }
}

/// generated route for
/// [_i21.RemoveAccountDialog]
class RemoveAccountRoute extends _i55.PageRouteInfo<void> {
  const RemoveAccountRoute({List<_i55.PageRouteInfo>? children})
      : super(
          RemoveAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'RemoveAccountRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i22.RecievePage]
class RecieveRoute extends _i55.PageRouteInfo<void> {
  const RecieveRoute({List<_i55.PageRouteInfo>? children})
      : super(
          RecieveRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecieveRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i23.NotificationsPage]
class NotificationsRoute extends _i55.PageRouteInfo<void> {
  const NotificationsRoute({List<_i55.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i24.AddContactPage]
class AddContactRoute extends _i55.PageRouteInfo<AddContactRouteArgs> {
  AddContactRoute({
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          AddContactRoute.name,
          args: AddContactRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddContactRoute';

  static const _i55.PageInfo<AddContactRouteArgs> page =
      _i55.PageInfo<AddContactRouteArgs>(name);
}

class AddContactRouteArgs {
  const AddContactRouteArgs({this.key});

  final _i56.Key? key;

  @override
  String toString() {
    return 'AddContactRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i25.WalletPage]
class WalletRoute extends _i55.PageRouteInfo<void> {
  const WalletRoute({List<_i55.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i26.WalletPageWrapper]
class WalletRouteWrapper extends _i55.PageRouteInfo<void> {
  const WalletRouteWrapper({List<_i55.PageRouteInfo>? children})
      : super(
          WalletRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'WalletRouteWrapper';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i27.TransferPageWrapper]
class TransferRouteWrapper
    extends _i55.PageRouteInfo<TransferRouteWrapperArgs> {
  TransferRouteWrapper({
    required _i60.TransferMetaDTO metadata,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          TransferRouteWrapper.name,
          args: TransferRouteWrapperArgs(
            metadata: metadata,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransferRouteWrapper';

  static const _i55.PageInfo<TransferRouteWrapperArgs> page =
      _i55.PageInfo<TransferRouteWrapperArgs>(name);
}

class TransferRouteWrapperArgs {
  const TransferRouteWrapperArgs({
    required this.metadata,
    this.key,
  });

  final _i60.TransferMetaDTO metadata;

  final _i56.Key? key;

  @override
  String toString() {
    return 'TransferRouteWrapperArgs{metadata: $metadata, key: $key}';
  }
}

/// generated route for
/// [_i28.TransferPage]
class TransferRoute extends _i55.PageRouteInfo<TransferRouteArgs> {
  TransferRoute({
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          TransferRoute.name,
          args: TransferRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TransferRoute';

  static const _i55.PageInfo<TransferRouteArgs> page =
      _i55.PageInfo<TransferRouteArgs>(name);
}

class TransferRouteArgs {
  const TransferRouteArgs({this.key});

  final _i56.Key? key;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i29.NonNativeTokenPageWrapper]
class NonNativeTokenRouteWrapper
    extends _i55.PageRouteInfo<NonNativeTokenRouteWrapperArgs> {
  NonNativeTokenRouteWrapper({
    required _i61.GetExtrinsicsUseCaseParams params,
    _i62.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          NonNativeTokenRouteWrapper.name,
          args: NonNativeTokenRouteWrapperArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NonNativeTokenRouteWrapper';

  static const _i55.PageInfo<NonNativeTokenRouteWrapperArgs> page =
      _i55.PageInfo<NonNativeTokenRouteWrapperArgs>(name);
}

class NonNativeTokenRouteWrapperArgs {
  const NonNativeTokenRouteWrapperArgs({
    required this.params,
    this.key,
  });

  final _i61.GetExtrinsicsUseCaseParams params;

  final _i62.Key? key;

  @override
  String toString() {
    return 'NonNativeTokenRouteWrapperArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [_i30.TransactionsHistoryPageWrapper]
class TransactionsHistoryRouteWrapper extends _i55.PageRouteInfo<void> {
  const TransactionsHistoryRouteWrapper({List<_i55.PageRouteInfo>? children})
      : super(
          TransactionsHistoryRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsHistoryRouteWrapper';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i31.ImportRawseedFormPage]
class ImportRawseedFormRoute
    extends _i55.PageRouteInfo<ImportRawseedFormRouteArgs> {
  ImportRawseedFormRoute({
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          ImportRawseedFormRoute.name,
          args: ImportRawseedFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportRawseedFormRoute';

  static const _i55.PageInfo<ImportRawseedFormRouteArgs> page =
      _i55.PageInfo<ImportRawseedFormRouteArgs>(name);
}

class ImportRawseedFormRouteArgs {
  const ImportRawseedFormRouteArgs({this.key});

  final _i56.Key? key;

  @override
  String toString() {
    return 'ImportRawseedFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i32.CreateAccountPageWrapper]
class CreateAccountRouteWrapper extends _i55.PageRouteInfo<void> {
  const CreateAccountRouteWrapper({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAccountRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRouteWrapper';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i33.CreateAccountFromObjectPage]
class CreateAccountFromObjectRoute extends _i55.PageRouteInfo<void> {
  const CreateAccountFromObjectRoute({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAccountFromObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountFromObjectRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i34.ImportMnemonicFormPage]
class ImportMnemonicFormRoute
    extends _i55.PageRouteInfo<ImportMnemonicFormRouteArgs> {
  ImportMnemonicFormRoute({
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          ImportMnemonicFormRoute.name,
          args: ImportMnemonicFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportMnemonicFormRoute';

  static const _i55.PageInfo<ImportMnemonicFormRouteArgs> page =
      _i55.PageInfo<ImportMnemonicFormRouteArgs>(name);
}

class ImportMnemonicFormRouteArgs {
  const ImportMnemonicFormRouteArgs({this.key});

  final _i56.Key? key;

  @override
  String toString() {
    return 'ImportMnemonicFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i35.CreateAccountInfoPage]
class CreateAccountInfoRoute extends _i55.PageRouteInfo<void> {
  const CreateAccountInfoRoute({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAccountInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountInfoRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i36.CreateAccountMnemonicBackupPage]
class CreateAccountMnemonicBackupRoute extends _i55.PageRouteInfo<void> {
  const CreateAccountMnemonicBackupRoute({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicBackupRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicBackupRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i37.CreateAccountMnemonicConfirmPage]
class CreateAccountMnemonicConfirmRoute extends _i55.PageRouteInfo<void> {
  const CreateAccountMnemonicConfirmRoute({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicConfirmRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i38.CreateAccountCredentialsPage]
class CreateAccountCredentialsRoute
    extends _i55.PageRouteInfo<CreateAccountCredentialsRouteArgs> {
  CreateAccountCredentialsRoute({
    required String appbarText,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          CreateAccountCredentialsRoute.name,
          args: CreateAccountCredentialsRouteArgs(
            appbarText: appbarText,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateAccountCredentialsRoute';

  static const _i55.PageInfo<CreateAccountCredentialsRouteArgs> page =
      _i55.PageInfo<CreateAccountCredentialsRouteArgs>(name);
}

class CreateAccountCredentialsRouteArgs {
  const CreateAccountCredentialsRouteArgs({
    required this.appbarText,
    this.key,
  });

  final String appbarText;

  final _i56.Key? key;

  @override
  String toString() {
    return 'CreateAccountCredentialsRouteArgs{appbarText: $appbarText, key: $key}';
  }
}

/// generated route for
/// [_i39.CreateAccountTypePage]
class CreateAccountTypeRoute extends _i55.PageRouteInfo<void> {
  const CreateAccountTypeRoute({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAccountTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountTypeRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i40.CreateAccountLoaderPage]
class CreateAccountLoaderRoute extends _i55.PageRouteInfo<void> {
  const CreateAccountLoaderRoute({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAccountLoaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountLoaderRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i41.NoStableHashDialog]
class NoStableHashRoute extends _i55.PageRouteInfo<void> {
  const NoStableHashRoute({List<_i55.PageRouteInfo>? children})
      : super(
          NoStableHashRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoStableHashRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i42.UploadedObjectPage]
class UploadedObjectRoute extends _i55.PageRouteInfo<UploadedObjectRouteArgs> {
  UploadedObjectRoute({
    required _i63.UploadedObject uploadedObject,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          UploadedObjectRoute.name,
          args: UploadedObjectRouteArgs(
            uploadedObject: uploadedObject,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadedObjectRoute';

  static const _i55.PageInfo<UploadedObjectRouteArgs> page =
      _i55.PageInfo<UploadedObjectRouteArgs>(name);
}

class UploadedObjectRouteArgs {
  const UploadedObjectRouteArgs({
    required this.uploadedObject,
    this.key,
  });

  final _i63.UploadedObject uploadedObject;

  final _i56.Key? key;

  @override
  String toString() {
    return 'UploadedObjectRouteArgs{uploadedObject: $uploadedObject, key: $key}';
  }
}

/// generated route for
/// [_i43.SettingsPage]
class SettingsRoute extends _i55.PageRouteInfo<void> {
  const SettingsRoute({List<_i55.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i44.SectionsSubPage]
class SectionsSubRoute extends _i55.PageRouteInfo<SectionsSubRouteArgs> {
  SectionsSubRoute({
    required _i64.GlobalSettings initialState,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          SectionsSubRoute.name,
          args: SectionsSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SectionsSubRoute';

  static const _i55.PageInfo<SectionsSubRouteArgs> page =
      _i55.PageInfo<SectionsSubRouteArgs>(name);
}

class SectionsSubRouteArgs {
  const SectionsSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i64.GlobalSettings initialState;

  final _i56.Key? key;

  @override
  String toString() {
    return 'SectionsSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i45.TransBytesSubPage]
class TransBytesSubRoute extends _i55.PageRouteInfo<TransBytesSubRouteArgs> {
  TransBytesSubRoute({
    required _i64.GlobalSettings initialState,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          TransBytesSubRoute.name,
          args: TransBytesSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransBytesSubRoute';

  static const _i55.PageInfo<TransBytesSubRouteArgs> page =
      _i55.PageInfo<TransBytesSubRouteArgs>(name);
}

class TransBytesSubRouteArgs {
  const TransBytesSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i64.GlobalSettings initialState;

  final _i56.Key? key;

  @override
  String toString() {
    return 'TransBytesSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i46.GridSizeSubPage]
class GridSizeSubRoute extends _i55.PageRouteInfo<void> {
  const GridSizeSubRoute({List<_i55.PageRouteInfo>? children})
      : super(
          GridSizeSubRoute.name,
          initialChildren: children,
        );

  static const String name = 'GridSizeSubRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i47.PixelRatioSubPage]
class PixelRatioSubRoute extends _i55.PageRouteInfo<void> {
  const PixelRatioSubRoute({List<_i55.PageRouteInfo>? children})
      : super(
          PixelRatioSubRoute.name,
          initialChildren: children,
        );

  static const String name = 'PixelRatioSubRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i48.WalletNodeSubPage]
class WalletNodeSubRoute extends _i55.PageRouteInfo<WalletNodeSubRouteArgs> {
  WalletNodeSubRoute({
    required _i64.GlobalSettings initialState,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          WalletNodeSubRoute.name,
          args: WalletNodeSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WalletNodeSubRoute';

  static const _i55.PageInfo<WalletNodeSubRouteArgs> page =
      _i55.PageInfo<WalletNodeSubRouteArgs>(name);
}

class WalletNodeSubRouteArgs {
  const WalletNodeSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i64.GlobalSettings initialState;

  final _i56.Key? key;

  @override
  String toString() {
    return 'WalletNodeSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i49.ChooseAlgorithmSubPage]
class ChooseAlgorithmSubRoute extends _i55.PageRouteInfo<void> {
  const ChooseAlgorithmSubRoute({List<_i55.PageRouteInfo>? children})
      : super(
          ChooseAlgorithmSubRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseAlgorithmSubRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i50.StableHashSubPage]
class StableHashSubRoute extends _i55.PageRouteInfo<StableHashSubRouteArgs> {
  StableHashSubRoute({
    required _i64.GlobalSettings initialState,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          StableHashSubRoute.name,
          args: StableHashSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StableHashSubRoute';

  static const _i55.PageInfo<StableHashSubRouteArgs> page =
      _i55.PageInfo<StableHashSubRouteArgs>(name);
}

class StableHashSubRouteArgs {
  const StableHashSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i64.GlobalSettings initialState;

  final _i56.Key? key;

  @override
  String toString() {
    return 'StableHashSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i51.EmptySettingsRoute]
class SettingsWrapperRoute extends _i55.PageRouteInfo<void> {
  const SettingsWrapperRoute({List<_i55.PageRouteInfo>? children})
      : super(
          SettingsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsWrapperRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i52.RenameObjectDialog]
class RenameObjectRoute extends _i55.PageRouteInfo<RenameObjectRouteArgs> {
  RenameObjectRoute({
    required _i57.Snapshot snapshot,
    required _i58.HashObject hashObject,
    _i56.Key? key,
    List<_i55.PageRouteInfo>? children,
  }) : super(
          RenameObjectRoute.name,
          args: RenameObjectRouteArgs(
            snapshot: snapshot,
            hashObject: hashObject,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RenameObjectRoute';

  static const _i55.PageInfo<RenameObjectRouteArgs> page =
      _i55.PageInfo<RenameObjectRouteArgs>(name);
}

class RenameObjectRouteArgs {
  const RenameObjectRouteArgs({
    required this.snapshot,
    required this.hashObject,
    this.key,
  });

  final _i57.Snapshot snapshot;

  final _i58.HashObject hashObject;

  final _i56.Key? key;

  @override
  String toString() {
    return 'RenameObjectRouteArgs{snapshot: $snapshot, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i53.CreateAssetPage]
class CreateAssetRoute extends _i55.PageRouteInfo<void> {
  const CreateAssetRoute({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAssetRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAssetRoute';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}

/// generated route for
/// [_i54.CreateAssetPageWrapper]
class CreateAssetRouteWrapper extends _i55.PageRouteInfo<void> {
  const CreateAssetRouteWrapper({List<_i55.PageRouteInfo>? children})
      : super(
          CreateAssetRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'CreateAssetRouteWrapper';

  static const _i55.PageInfo<void> page = _i55.PageInfo<void>(name);
}
