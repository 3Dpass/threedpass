// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i74;
import 'package:flutter/cupertino.dart' as _i79;
import 'package:flutter/material.dart' as _i75;
import 'package:threedpass/core/widgets/default_loading_dialog.dart' as _i25;
import 'package:threedpass/core/widgets/dialog/d3p_choose_datetime_modal.dart'
    as _i23;
import 'package:threedpass/core/widgets/dialog/d3p_notification_dialog.dart'
    as _i24;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_credentials.dart'
    as _i9;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_from_object/create_account_from_object.dart'
    as _i10;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_info_page.dart'
    as _i11;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_loader.dart'
    as _i12;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_backup.dart'
    as _i13;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_confirm.dart'
    as _i14;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_type.dart'
    as _i16;
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart'
    as _i15;
import 'package:threedpass/features/accounts/presentation/pages/create_account/import_mnemonic_form.dart'
    as _i35;
import 'package:threedpass/features/accounts/presentation/pages/create_account/import_rawseed_form.dart'
    as _i36;
import 'package:threedpass/features/accounts/presentation/pages/no_stable_hash_dialog.dart'
    as _i40;
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart'
    as _i76;
import 'package:threedpass/features/asset_conversion/ui/add_liquidity/presentation/add_liquidity_page_wrapper.dart'
    as _i2;
import 'package:threedpass/features/asset_conversion/ui/create_pool/presentation/create_pool_page_wrapper.dart'
    as _i19;
import 'package:threedpass/features/asset_conversion/ui/pools_list/presentation/pools_page.dart'
    as _i46;
import 'package:threedpass/features/asset_conversion/ui/pools_list/presentation/pools_page_wrapper.dart'
    as _i47;
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/presentation/remove_liquidity_page_wrapper.dart'
    as _i52;
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/swap_page_wrapper.dart'
    as _i65;
import 'package:threedpass/features/atomic_swap/cancel/presentation/cancel_atomic_swap_page_warpper.dart'
    as _i3;
import 'package:threedpass/features/atomic_swap/claim/presentation/claim_atomic_swap_page_wrapper.dart'
    as _i6;
import 'package:threedpass/features/atomic_swap/create/presentation/create_swap_page_wapper.dart'
    as _i20;
import 'package:threedpass/features/atomic_swap/pending/presentation/pending_atomic_swap_page_wrapper.dart'
    as _i44;
import 'package:threedpass/features/compare_page/presentation/pages/compare_page_wrapper.dart'
    as _i7;
import 'package:threedpass/features/explorer_page/explorer_page_wrapper.dart'
    as _i32;
import 'package:threedpass/features/explorer_page/objects_list_page/objects_list_page.dart'
    as _i43;
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart'
    as _i78;
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart'
    as _i77;
import 'package:threedpass/features/home_page/presentation/home_page.dart'
    as _i34;
import 'package:threedpass/features/home_page/presentation/login_page.dart'
    as _i37;
import 'package:threedpass/features/home_page/router/empty_initial_route.dart'
    as _i29;
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/create_asset_page.dart'
    as _i17;
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/create_asset_page_wrapper.dart'
    as _i18;
import 'package:threedpass/features/poscan_assets/ui/mint_asset/presentation/mint_asset_page.dart'
    as _i38;
import 'package:threedpass/features/poscan_assets/ui/mint_asset/presentation/mint_asset_page_wrapper.dart'
    as _i39;
import 'package:threedpass/features/poscan_assets/ui/set_metadata/presentation/set_metadata_page.dart'
    as _i61;
import 'package:threedpass/features/poscan_assets/ui/set_metadata/presentation/set_metadata_page_wrapper.dart'
    as _i62;
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart'
    as _i85;
import 'package:threedpass/features/poscan_putobject/presentation/d3prpc_page.dart'
    as _i21;
import 'package:threedpass/features/poscan_putobject/presentation/d3rpc_page_wrapper.dart'
    as _i22;
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_category_bottom_sheet.dart'
    as _i5;
import 'package:threedpass/features/preview/delete_snapshot_dialog/delete_snapshot_dialog.dart'
    as _i27;
import 'package:threedpass/features/preview/explain_put_object_page/explain_put_object_page.dart'
    as _i31;
import 'package:threedpass/features/preview/preview_page/presentation/preview_page.dart'
    as _i48;
import 'package:threedpass/features/preview/preview_page/presentation/preview_page_wrapper.dart'
    as _i49;
import 'package:threedpass/features/preview/preview_page/presentation/widgets/save_hash_dialog.dart'
    as _i55;
import 'package:threedpass/features/preview/preview_page/presentation/widgets/save_object_dialog/save_object_dialog.dart'
    as _i56;
import 'package:threedpass/features/preview/rename_object_dialog/rename_object_dialog.dart'
    as _i53;
import 'package:threedpass/features/preview/rename_snapshot_dialog/rename_snapshot_dialog.dart'
    as _i54;
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart'
    as _i81;
import 'package:threedpass/features/scan_page/presentation/scan_page.dart'
    as _i57;
import 'package:threedpass/features/scan_page/presentation/scan_page_wrapper.dart'
    as _i58;
import 'package:threedpass/features/scan_page/presentation/widgets/floating_action_button/delete_snapshots_dialog.dart'
    as _i28;
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart'
    as _i83;
import 'package:threedpass/features/settings_page/presentation/settings_page.dart'
    as _i63;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/choose_algorithm_subpage.dart'
    as _i4;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/grid_size_subpage.dart'
    as _i33;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/pixel_ratio_subpage.dart'
    as _i45;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/sections_subpage.dart'
    as _i59;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/stable_hash_subpage.dart'
    as _i64;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/trans_bytes_subpage.dart'
    as _i66;
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/wallet_node_subpage.dart'
    as _i71;
import 'package:threedpass/features/settings_page/router/empty_settings_route.dart'
    as _i30;
import 'package:threedpass/features/uploaded_object_page/uploaded_object_wrapper.dart'
    as _i70;
import 'package:threedpass/features/wallet_screen/add_contact_page/add_contact_page.dart'
    as _i1;
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart'
    as _i80;
import 'package:threedpass/features/wallet_screen/assets_page/remove_account_dialog.dart'
    as _i51;
import 'package:threedpass/features/wallet_screen/choose_account_page/choose_account_page.dart'
    as _i60;
import 'package:threedpass/features/wallet_screen/contacts_page/contacts_page.dart'
    as _i8;
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/delete_contact_dialog.dart'
    as _i26;
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart'
    as _i82;
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/non_native_token_wrapper.dart'
    as _i41;
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/notifications_page.dart'
    as _i42;
import 'package:threedpass/features/wallet_screen/recieve_page/recieve_page.dart'
    as _i50;
import 'package:threedpass/features/wallet_screen/transactions_history/presentation/transactions_history_wrapper.dart'
    as _i67;
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart'
    as _i84;
import 'package:threedpass/features/wallet_screen/transfer_page/transfer_page.dart'
    as _i68;
import 'package:threedpass/features/wallet_screen/transfer_page/transfer_page_wrapper.dart'
    as _i69;
import 'package:threedpass/features/wallet_screen/wallet_page/wallet_page.dart'
    as _i72;
import 'package:threedpass/features/wallet_screen/wallet_page/wallet_page_wrapper.dart'
    as _i73;

abstract class $RootRouter extends _i74.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i74.PageFactory> pagesMap = {
    AddContactRoute.name: (routeData) {
      final args = routeData.argsAs<AddContactRouteArgs>(
          orElse: () => const AddContactRouteArgs());
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddContactPage(key: args.key),
      );
    },
    AddLiquidityRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<AddLiquidityRouteWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddLiquidityPageWrapper(
          poolFullInfo: args.poolFullInfo,
          key: args.key,
        ),
      );
    },
    CancelAtomicSwapRouteWarpper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i74.WrappedRoute(child: const _i3.CancelAtomicSwapPageWarpper()),
      );
    },
    ChooseAlgorithmSubRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChooseAlgorithmSubPage(),
      );
    },
    ChooseCategoryBottomSheetRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ChooseCategoryBottomSheet(),
      );
    },
    ClaimAtomicSwapRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i6.ClaimAtomicSwapPageWrapper()),
      );
    },
    CompareRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<CompareRouteWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ComparePageWrapper(
          origObj: args.origObj,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    ContactsRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ContactsPage(),
      );
    },
    CreateAccountCredentialsRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountCredentialsRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.CreateAccountCredentialsPage(
          appbarText: args.appbarText,
          key: args.key,
        ),
      );
    },
    CreateAccountFromObjectRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CreateAccountFromObjectPage(),
      );
    },
    CreateAccountInfoRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.CreateAccountInfoPage(),
      );
    },
    CreateAccountLoaderRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.CreateAccountLoaderPage(),
      );
    },
    CreateAccountMnemonicBackupRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.CreateAccountMnemonicBackupPage(),
      );
    },
    CreateAccountMnemonicConfirmRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.CreateAccountMnemonicConfirmPage(),
      );
    },
    CreateAccountRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i15.CreateAccountPageWrapper()),
      );
    },
    CreateAccountTypeRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.CreateAccountTypePage(),
      );
    },
    CreateAssetRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.CreateAssetPage(),
      );
    },
    CreateAssetRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i18.CreateAssetPageWrapper()),
      );
    },
    CreatePoolRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.CreatePoolPageWrapper(),
      );
    },
    CreateSwapRouteWapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i20.CreateSwapPageWapper()),
      );
    },
    D3PRPCRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.D3PRPCPage(),
      );
    },
    D3PRPCRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i22.D3PRPCPageWrapper()),
      );
    },
    ChooseDateTimeRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseDateTimeRouteArgs>(
          orElse: () => const ChooseDateTimeRouteArgs());
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.D3pChooseDateTimeModal(
          key: args.key,
          initialDate: args.initialDate,
          firstDate: args.firstDate,
          lastDate: args.lastDate,
          onDone: args.onDone,
          onCancel: args.onCancel,
        ),
      );
    },
    NotificationDialogRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationDialogRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.D3pNotificationDialog(
          key: args.key,
          title: args.title,
          message: args.message,
        ),
      );
    },
    DefaultLoadingRoute.name: (routeData) {
      final args = routeData.argsAs<DefaultLoadingRouteArgs>(
          orElse: () => const DefaultLoadingRouteArgs());
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.DefaultLoadingDialog(
          key: args.key,
          text: args.text,
        ),
      );
    },
    DeleteContactRoute.name: (routeData) {
      final args = routeData.argsAs<DeleteContactRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.DeleteContactDialog(
          contact: args.contact,
          key: args.key,
        ),
      );
    },
    DeleteSnapshotRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.DeleteSnapshotDialog(),
      );
    },
    DeleteSnapshotsRoute.name: (routeData) {
      final args = routeData.argsAs<DeleteSnapshotsRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.DeleteSnapshotsDialog(
          selectSnapshotsCubit: args.selectSnapshotsCubit,
          key: args.key,
        ),
      );
    },
    InitialWrapperRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.EmptyInitialRoute(),
      );
    },
    SettingsWrapperRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.EmptySettingsRoute(),
      );
    },
    ExplainPutObjectRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.ExplainPutObjectPage(),
      );
    },
    ExplorerRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i32.ExplorerPageWrapper()),
      );
    },
    GridSizeSubRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.GridSizeSubPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.HomePage(),
      );
    },
    ImportMnemonicFormRoute.name: (routeData) {
      final args = routeData.argsAs<ImportMnemonicFormRouteArgs>(
          orElse: () => const ImportMnemonicFormRouteArgs());
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.ImportMnemonicFormPage(key: args.key),
      );
    },
    ImportRawseedFormRoute.name: (routeData) {
      final args = routeData.argsAs<ImportRawseedFormRouteArgs>(
          orElse: () => const ImportRawseedFormRouteArgs());
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i36.ImportRawseedFormPage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i74.AutoRoutePage<bool>(
        routeData: routeData,
        child: _i37.LoginPage(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    MintAssetRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.MintAssetPage(),
      );
    },
    MintAssetRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<MintAssetRouteWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(
            child: _i39.MintAssetPageWrapper(
          initialAssetId: args.initialAssetId,
          key: args.key,
        )),
      );
    },
    NoStableHashRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.NoStableHashDialog(),
      );
    },
    NonNativeTokenRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<NonNativeTokenRouteWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i41.NonNativeTokenPageWrapper(
          args.params,
          key: args.key,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i42.NotificationsPage(),
      );
    },
    ObjectsListRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i43.ObjectsListPage(),
      );
    },
    PendingAtomicSwapRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i74.WrappedRoute(child: const _i44.PendingAtomicSwapPageWrapper()),
      );
    },
    PixelRatioSubRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i45.PixelRatioSubPage(),
      );
    },
    PoolsRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.PoolsPage(),
      );
    },
    PoolsRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i47.PoolsPageWrapper()),
      );
    },
    PreviewRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i48.PreviewPage(),
      );
    },
    PreviewRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<PreviewRouteWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(
            child: _i49.PreviewPageWrapper(
          snapshot: args.snapshot,
          key: args.key,
        )),
      );
    },
    RecieveRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i50.RecievePage(),
      );
    },
    RemoveAccountRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i51.RemoveAccountDialog(),
      );
    },
    RemoveLiquidityRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<RemoveLiquidityRouteWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i52.RemoveLiquidityPageWrapper(
          poolFullInfo: args.poolFullInfo,
          key: args.key,
        ),
      );
    },
    RenameObjectRoute.name: (routeData) {
      final args = routeData.argsAs<RenameObjectRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i53.RenameObjectDialog(
          snapshot: args.snapshot,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    RenameSnapshotRoute.name: (routeData) {
      final args = routeData.argsAs<RenameSnapshotRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i54.RenameSnapshotDialog(
          snapshot: args.snapshot,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    SaveHashRoute.name: (routeData) {
      final args = routeData.argsAs<SaveHashRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i55.SaveHashDialog(
          snapshot: args.snapshot,
          hashObject: args.hashObject,
          key: args.key,
        ),
      );
    },
    SaveObjectRoute.name: (routeData) {
      final args = routeData.argsAs<SaveObjectRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i56.SaveObjectDialog(
          snapshot: args.snapshot,
          key: args.key,
        ),
      );
    },
    ScanRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i57.ScanPage(),
      );
    },
    ScanRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i58.ScanPageWrapper()),
      );
    },
    SectionsSubRoute.name: (routeData) {
      final args = routeData.argsAs<SectionsSubRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i59.SectionsSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    SelectAccountRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i60.SelectAccountPage(),
      );
    },
    SetMetadataRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i61.SetMetadataPage(),
      );
    },
    SetMetadataRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<SetMetadataRouteWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(
            child: _i62.SetMetadataPageWrapper(
          initialAssetId: args.initialAssetId,
          key: args.key,
        )),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i63.SettingsPage(),
      );
    },
    StableHashSubRoute.name: (routeData) {
      final args = routeData.argsAs<StableHashSubRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i64.StableHashSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    SwapRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i65.SwapPageWrapper(),
      );
    },
    TransBytesSubRoute.name: (routeData) {
      final args = routeData.argsAs<TransBytesSubRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i66.TransBytesSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    TransactionsHistoryRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i67.TransactionsHistoryPageWrapper(),
      );
    },
    TransferRoute.name: (routeData) {
      final args = routeData.argsAs<TransferRouteArgs>(
          orElse: () => const TransferRouteArgs());
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i68.TransferPage(key: args.key),
      );
    },
    TransferRouteWrapper.name: (routeData) {
      final args = routeData.argsAs<TransferRouteWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(
            child: _i69.TransferPageWrapper(
          metadata: args.metadata,
          key: args.key,
        )),
      );
    },
    UploadedObjectWrapper.name: (routeData) {
      final args = routeData.argsAs<UploadedObjectWrapperArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i70.UploadedObjectWrapper(
          objectId: args.objectId,
          uploadedObject: args.uploadedObject,
          key: args.key,
        ),
      );
    },
    WalletNodeSubRoute.name: (routeData) {
      final args = routeData.argsAs<WalletNodeSubRouteArgs>();
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i71.WalletNodeSubPage(
          initialState: args.initialState,
          key: args.key,
        ),
      );
    },
    WalletRoute.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i72.WalletPage(),
      );
    },
    WalletRouteWrapper.name: (routeData) {
      return _i74.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i74.WrappedRoute(child: const _i73.WalletPageWrapper()),
      );
    },
  };
}

/// generated route for
/// [_i1.AddContactPage]
class AddContactRoute extends _i74.PageRouteInfo<AddContactRouteArgs> {
  AddContactRoute({
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          AddContactRoute.name,
          args: AddContactRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddContactRoute';

  static const _i74.PageInfo<AddContactRouteArgs> page =
      _i74.PageInfo<AddContactRouteArgs>(name);
}

class AddContactRouteArgs {
  const AddContactRouteArgs({this.key});

  final _i75.Key? key;

  @override
  String toString() {
    return 'AddContactRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AddLiquidityPageWrapper]
class AddLiquidityRouteWrapper
    extends _i74.PageRouteInfo<AddLiquidityRouteWrapperArgs> {
  AddLiquidityRouteWrapper({
    required _i76.PoolFullInfo poolFullInfo,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          AddLiquidityRouteWrapper.name,
          args: AddLiquidityRouteWrapperArgs(
            poolFullInfo: poolFullInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddLiquidityRouteWrapper';

  static const _i74.PageInfo<AddLiquidityRouteWrapperArgs> page =
      _i74.PageInfo<AddLiquidityRouteWrapperArgs>(name);
}

class AddLiquidityRouteWrapperArgs {
  const AddLiquidityRouteWrapperArgs({
    required this.poolFullInfo,
    this.key,
  });

  final _i76.PoolFullInfo poolFullInfo;

  final _i75.Key? key;

  @override
  String toString() {
    return 'AddLiquidityRouteWrapperArgs{poolFullInfo: $poolFullInfo, key: $key}';
  }
}

/// generated route for
/// [_i3.CancelAtomicSwapPageWarpper]
class CancelAtomicSwapRouteWarpper extends _i74.PageRouteInfo<void> {
  const CancelAtomicSwapRouteWarpper({List<_i74.PageRouteInfo>? children})
      : super(
          CancelAtomicSwapRouteWarpper.name,
          initialChildren: children,
        );

  static const String name = 'CancelAtomicSwapRouteWarpper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChooseAlgorithmSubPage]
class ChooseAlgorithmSubRoute extends _i74.PageRouteInfo<void> {
  const ChooseAlgorithmSubRoute({List<_i74.PageRouteInfo>? children})
      : super(
          ChooseAlgorithmSubRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseAlgorithmSubRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ChooseCategoryBottomSheet]
class ChooseCategoryBottomSheetRoute extends _i74.PageRouteInfo<void> {
  const ChooseCategoryBottomSheetRoute({List<_i74.PageRouteInfo>? children})
      : super(
          ChooseCategoryBottomSheetRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseCategoryBottomSheetRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ClaimAtomicSwapPageWrapper]
class ClaimAtomicSwapRouteWrapper extends _i74.PageRouteInfo<void> {
  const ClaimAtomicSwapRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          ClaimAtomicSwapRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'ClaimAtomicSwapRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ComparePageWrapper]
class CompareRouteWrapper extends _i74.PageRouteInfo<CompareRouteWrapperArgs> {
  CompareRouteWrapper({
    required _i77.Snapshot origObj,
    required _i78.HashObject hashObject,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
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

  static const _i74.PageInfo<CompareRouteWrapperArgs> page =
      _i74.PageInfo<CompareRouteWrapperArgs>(name);
}

class CompareRouteWrapperArgs {
  const CompareRouteWrapperArgs({
    required this.origObj,
    required this.hashObject,
    this.key,
  });

  final _i77.Snapshot origObj;

  final _i78.HashObject hashObject;

  final _i75.Key? key;

  @override
  String toString() {
    return 'CompareRouteWrapperArgs{origObj: $origObj, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i8.ContactsPage]
class ContactsRoute extends _i74.PageRouteInfo<void> {
  const ContactsRoute({List<_i74.PageRouteInfo>? children})
      : super(
          ContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CreateAccountCredentialsPage]
class CreateAccountCredentialsRoute
    extends _i74.PageRouteInfo<CreateAccountCredentialsRouteArgs> {
  CreateAccountCredentialsRoute({
    required String appbarText,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          CreateAccountCredentialsRoute.name,
          args: CreateAccountCredentialsRouteArgs(
            appbarText: appbarText,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateAccountCredentialsRoute';

  static const _i74.PageInfo<CreateAccountCredentialsRouteArgs> page =
      _i74.PageInfo<CreateAccountCredentialsRouteArgs>(name);
}

class CreateAccountCredentialsRouteArgs {
  const CreateAccountCredentialsRouteArgs({
    required this.appbarText,
    this.key,
  });

  final String appbarText;

  final _i75.Key? key;

  @override
  String toString() {
    return 'CreateAccountCredentialsRouteArgs{appbarText: $appbarText, key: $key}';
  }
}

/// generated route for
/// [_i10.CreateAccountFromObjectPage]
class CreateAccountFromObjectRoute extends _i74.PageRouteInfo<void> {
  const CreateAccountFromObjectRoute({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAccountFromObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountFromObjectRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CreateAccountInfoPage]
class CreateAccountInfoRoute extends _i74.PageRouteInfo<void> {
  const CreateAccountInfoRoute({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAccountInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountInfoRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CreateAccountLoaderPage]
class CreateAccountLoaderRoute extends _i74.PageRouteInfo<void> {
  const CreateAccountLoaderRoute({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAccountLoaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountLoaderRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i13.CreateAccountMnemonicBackupPage]
class CreateAccountMnemonicBackupRoute extends _i74.PageRouteInfo<void> {
  const CreateAccountMnemonicBackupRoute({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicBackupRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicBackupRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CreateAccountMnemonicConfirmPage]
class CreateAccountMnemonicConfirmRoute extends _i74.PageRouteInfo<void> {
  const CreateAccountMnemonicConfirmRoute({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAccountMnemonicConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountMnemonicConfirmRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i15.CreateAccountPageWrapper]
class CreateAccountRouteWrapper extends _i74.PageRouteInfo<void> {
  const CreateAccountRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAccountRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i16.CreateAccountTypePage]
class CreateAccountTypeRoute extends _i74.PageRouteInfo<void> {
  const CreateAccountTypeRoute({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAccountTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountTypeRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i17.CreateAssetPage]
class CreateAssetRoute extends _i74.PageRouteInfo<void> {
  const CreateAssetRoute({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAssetRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAssetRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i18.CreateAssetPageWrapper]
class CreateAssetRouteWrapper extends _i74.PageRouteInfo<void> {
  const CreateAssetRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          CreateAssetRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'CreateAssetRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i19.CreatePoolPageWrapper]
class CreatePoolRouteWrapper extends _i74.PageRouteInfo<void> {
  const CreatePoolRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          CreatePoolRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'CreatePoolRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i20.CreateSwapPageWapper]
class CreateSwapRouteWapper extends _i74.PageRouteInfo<void> {
  const CreateSwapRouteWapper({List<_i74.PageRouteInfo>? children})
      : super(
          CreateSwapRouteWapper.name,
          initialChildren: children,
        );

  static const String name = 'CreateSwapRouteWapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i21.D3PRPCPage]
class D3PRPCRoute extends _i74.PageRouteInfo<void> {
  const D3PRPCRoute({List<_i74.PageRouteInfo>? children})
      : super(
          D3PRPCRoute.name,
          initialChildren: children,
        );

  static const String name = 'D3PRPCRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i22.D3PRPCPageWrapper]
class D3PRPCRouteWrapper extends _i74.PageRouteInfo<void> {
  const D3PRPCRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          D3PRPCRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'D3PRPCRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i23.D3pChooseDateTimeModal]
class ChooseDateTimeRoute extends _i74.PageRouteInfo<ChooseDateTimeRouteArgs> {
  ChooseDateTimeRoute({
    _i79.Key? key,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    void Function(DateTime)? onDone,
    void Function()? onCancel,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          ChooseDateTimeRoute.name,
          args: ChooseDateTimeRouteArgs(
            key: key,
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
            onDone: onDone,
            onCancel: onCancel,
          ),
          initialChildren: children,
        );

  static const String name = 'ChooseDateTimeRoute';

  static const _i74.PageInfo<ChooseDateTimeRouteArgs> page =
      _i74.PageInfo<ChooseDateTimeRouteArgs>(name);
}

class ChooseDateTimeRouteArgs {
  const ChooseDateTimeRouteArgs({
    this.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDone,
    this.onCancel,
  });

  final _i79.Key? key;

  final DateTime? initialDate;

  final DateTime? firstDate;

  final DateTime? lastDate;

  final void Function(DateTime)? onDone;

  final void Function()? onCancel;

  @override
  String toString() {
    return 'ChooseDateTimeRouteArgs{key: $key, initialDate: $initialDate, firstDate: $firstDate, lastDate: $lastDate, onDone: $onDone, onCancel: $onCancel}';
  }
}

/// generated route for
/// [_i24.D3pNotificationDialog]
class NotificationDialogRoute
    extends _i74.PageRouteInfo<NotificationDialogRouteArgs> {
  NotificationDialogRoute({
    _i79.Key? key,
    required String title,
    required String message,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          NotificationDialogRoute.name,
          args: NotificationDialogRouteArgs(
            key: key,
            title: title,
            message: message,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationDialogRoute';

  static const _i74.PageInfo<NotificationDialogRouteArgs> page =
      _i74.PageInfo<NotificationDialogRouteArgs>(name);
}

class NotificationDialogRouteArgs {
  const NotificationDialogRouteArgs({
    this.key,
    required this.title,
    required this.message,
  });

  final _i79.Key? key;

  final String title;

  final String message;

  @override
  String toString() {
    return 'NotificationDialogRouteArgs{key: $key, title: $title, message: $message}';
  }
}

/// generated route for
/// [_i25.DefaultLoadingDialog]
class DefaultLoadingRoute extends _i74.PageRouteInfo<DefaultLoadingRouteArgs> {
  DefaultLoadingRoute({
    _i75.Key? key,
    String? text,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          DefaultLoadingRoute.name,
          args: DefaultLoadingRouteArgs(
            key: key,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'DefaultLoadingRoute';

  static const _i74.PageInfo<DefaultLoadingRouteArgs> page =
      _i74.PageInfo<DefaultLoadingRouteArgs>(name);
}

class DefaultLoadingRouteArgs {
  const DefaultLoadingRouteArgs({
    this.key,
    this.text,
  });

  final _i75.Key? key;

  final String? text;

  @override
  String toString() {
    return 'DefaultLoadingRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [_i26.DeleteContactDialog]
class DeleteContactRoute extends _i74.PageRouteInfo<DeleteContactRouteArgs> {
  DeleteContactRoute({
    required _i80.Contact contact,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          DeleteContactRoute.name,
          args: DeleteContactRouteArgs(
            contact: contact,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DeleteContactRoute';

  static const _i74.PageInfo<DeleteContactRouteArgs> page =
      _i74.PageInfo<DeleteContactRouteArgs>(name);
}

class DeleteContactRouteArgs {
  const DeleteContactRouteArgs({
    required this.contact,
    this.key,
  });

  final _i80.Contact contact;

  final _i75.Key? key;

  @override
  String toString() {
    return 'DeleteContactRouteArgs{contact: $contact, key: $key}';
  }
}

/// generated route for
/// [_i27.DeleteSnapshotDialog]
class DeleteSnapshotRoute extends _i74.PageRouteInfo<void> {
  const DeleteSnapshotRoute({List<_i74.PageRouteInfo>? children})
      : super(
          DeleteSnapshotRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeleteSnapshotRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i28.DeleteSnapshotsDialog]
class DeleteSnapshotsRoute
    extends _i74.PageRouteInfo<DeleteSnapshotsRouteArgs> {
  DeleteSnapshotsRoute({
    required _i81.SelectSnapshotsCubit selectSnapshotsCubit,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          DeleteSnapshotsRoute.name,
          args: DeleteSnapshotsRouteArgs(
            selectSnapshotsCubit: selectSnapshotsCubit,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DeleteSnapshotsRoute';

  static const _i74.PageInfo<DeleteSnapshotsRouteArgs> page =
      _i74.PageInfo<DeleteSnapshotsRouteArgs>(name);
}

class DeleteSnapshotsRouteArgs {
  const DeleteSnapshotsRouteArgs({
    required this.selectSnapshotsCubit,
    this.key,
  });

  final _i81.SelectSnapshotsCubit selectSnapshotsCubit;

  final _i75.Key? key;

  @override
  String toString() {
    return 'DeleteSnapshotsRouteArgs{selectSnapshotsCubit: $selectSnapshotsCubit, key: $key}';
  }
}

/// generated route for
/// [_i29.EmptyInitialRoute]
class InitialWrapperRoute extends _i74.PageRouteInfo<void> {
  const InitialWrapperRoute({List<_i74.PageRouteInfo>? children})
      : super(
          InitialWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialWrapperRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i30.EmptySettingsRoute]
class SettingsWrapperRoute extends _i74.PageRouteInfo<void> {
  const SettingsWrapperRoute({List<_i74.PageRouteInfo>? children})
      : super(
          SettingsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsWrapperRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i31.ExplainPutObjectPage]
class ExplainPutObjectRoute extends _i74.PageRouteInfo<void> {
  const ExplainPutObjectRoute({List<_i74.PageRouteInfo>? children})
      : super(
          ExplainPutObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExplainPutObjectRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i32.ExplorerPageWrapper]
class ExplorerRouteWrapper extends _i74.PageRouteInfo<void> {
  const ExplorerRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          ExplorerRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'ExplorerRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i33.GridSizeSubPage]
class GridSizeSubRoute extends _i74.PageRouteInfo<void> {
  const GridSizeSubRoute({List<_i74.PageRouteInfo>? children})
      : super(
          GridSizeSubRoute.name,
          initialChildren: children,
        );

  static const String name = 'GridSizeSubRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i34.HomePage]
class HomeRoute extends _i74.PageRouteInfo<void> {
  const HomeRoute({List<_i74.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i35.ImportMnemonicFormPage]
class ImportMnemonicFormRoute
    extends _i74.PageRouteInfo<ImportMnemonicFormRouteArgs> {
  ImportMnemonicFormRoute({
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          ImportMnemonicFormRoute.name,
          args: ImportMnemonicFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportMnemonicFormRoute';

  static const _i74.PageInfo<ImportMnemonicFormRouteArgs> page =
      _i74.PageInfo<ImportMnemonicFormRouteArgs>(name);
}

class ImportMnemonicFormRouteArgs {
  const ImportMnemonicFormRouteArgs({this.key});

  final _i75.Key? key;

  @override
  String toString() {
    return 'ImportMnemonicFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i36.ImportRawseedFormPage]
class ImportRawseedFormRoute
    extends _i74.PageRouteInfo<ImportRawseedFormRouteArgs> {
  ImportRawseedFormRoute({
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          ImportRawseedFormRoute.name,
          args: ImportRawseedFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ImportRawseedFormRoute';

  static const _i74.PageInfo<ImportRawseedFormRouteArgs> page =
      _i74.PageInfo<ImportRawseedFormRouteArgs>(name);
}

class ImportRawseedFormRouteArgs {
  const ImportRawseedFormRouteArgs({this.key});

  final _i75.Key? key;

  @override
  String toString() {
    return 'ImportRawseedFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i37.LoginPage]
class LoginRoute extends _i74.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i75.Key? key,
    void Function(bool)? onLoginResult,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i74.PageInfo<LoginRouteArgs> page =
      _i74.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onLoginResult,
  });

  final _i75.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i38.MintAssetPage]
class MintAssetRoute extends _i74.PageRouteInfo<void> {
  const MintAssetRoute({List<_i74.PageRouteInfo>? children})
      : super(
          MintAssetRoute.name,
          initialChildren: children,
        );

  static const String name = 'MintAssetRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i39.MintAssetPageWrapper]
class MintAssetRouteWrapper
    extends _i74.PageRouteInfo<MintAssetRouteWrapperArgs> {
  MintAssetRouteWrapper({
    required int initialAssetId,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          MintAssetRouteWrapper.name,
          args: MintAssetRouteWrapperArgs(
            initialAssetId: initialAssetId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MintAssetRouteWrapper';

  static const _i74.PageInfo<MintAssetRouteWrapperArgs> page =
      _i74.PageInfo<MintAssetRouteWrapperArgs>(name);
}

class MintAssetRouteWrapperArgs {
  const MintAssetRouteWrapperArgs({
    required this.initialAssetId,
    this.key,
  });

  final int initialAssetId;

  final _i75.Key? key;

  @override
  String toString() {
    return 'MintAssetRouteWrapperArgs{initialAssetId: $initialAssetId, key: $key}';
  }
}

/// generated route for
/// [_i40.NoStableHashDialog]
class NoStableHashRoute extends _i74.PageRouteInfo<void> {
  const NoStableHashRoute({List<_i74.PageRouteInfo>? children})
      : super(
          NoStableHashRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoStableHashRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i41.NonNativeTokenPageWrapper]
class NonNativeTokenRouteWrapper
    extends _i74.PageRouteInfo<NonNativeTokenRouteWrapperArgs> {
  NonNativeTokenRouteWrapper({
    required _i82.GetExtrinsicsUseCaseParams params,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          NonNativeTokenRouteWrapper.name,
          args: NonNativeTokenRouteWrapperArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NonNativeTokenRouteWrapper';

  static const _i74.PageInfo<NonNativeTokenRouteWrapperArgs> page =
      _i74.PageInfo<NonNativeTokenRouteWrapperArgs>(name);
}

class NonNativeTokenRouteWrapperArgs {
  const NonNativeTokenRouteWrapperArgs({
    required this.params,
    this.key,
  });

  final _i82.GetExtrinsicsUseCaseParams params;

  final _i75.Key? key;

  @override
  String toString() {
    return 'NonNativeTokenRouteWrapperArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [_i42.NotificationsPage]
class NotificationsRoute extends _i74.PageRouteInfo<void> {
  const NotificationsRoute({List<_i74.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i43.ObjectsListPage]
class ObjectsListRoute extends _i74.PageRouteInfo<void> {
  const ObjectsListRoute({List<_i74.PageRouteInfo>? children})
      : super(
          ObjectsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ObjectsListRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i44.PendingAtomicSwapPageWrapper]
class PendingAtomicSwapRouteWrapper extends _i74.PageRouteInfo<void> {
  const PendingAtomicSwapRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          PendingAtomicSwapRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'PendingAtomicSwapRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i45.PixelRatioSubPage]
class PixelRatioSubRoute extends _i74.PageRouteInfo<void> {
  const PixelRatioSubRoute({List<_i74.PageRouteInfo>? children})
      : super(
          PixelRatioSubRoute.name,
          initialChildren: children,
        );

  static const String name = 'PixelRatioSubRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i46.PoolsPage]
class PoolsRoute extends _i74.PageRouteInfo<void> {
  const PoolsRoute({List<_i74.PageRouteInfo>? children})
      : super(
          PoolsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PoolsRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i47.PoolsPageWrapper]
class PoolsRouteWrapper extends _i74.PageRouteInfo<void> {
  const PoolsRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          PoolsRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'PoolsRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i48.PreviewPage]
class PreviewRoute extends _i74.PageRouteInfo<void> {
  const PreviewRoute({List<_i74.PageRouteInfo>? children})
      : super(
          PreviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i49.PreviewPageWrapper]
class PreviewRouteWrapper extends _i74.PageRouteInfo<PreviewRouteWrapperArgs> {
  PreviewRouteWrapper({
    required _i77.Snapshot snapshot,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          PreviewRouteWrapper.name,
          args: PreviewRouteWrapperArgs(
            snapshot: snapshot,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviewRouteWrapper';

  static const _i74.PageInfo<PreviewRouteWrapperArgs> page =
      _i74.PageInfo<PreviewRouteWrapperArgs>(name);
}

class PreviewRouteWrapperArgs {
  const PreviewRouteWrapperArgs({
    required this.snapshot,
    this.key,
  });

  final _i77.Snapshot snapshot;

  final _i75.Key? key;

  @override
  String toString() {
    return 'PreviewRouteWrapperArgs{snapshot: $snapshot, key: $key}';
  }
}

/// generated route for
/// [_i50.RecievePage]
class RecieveRoute extends _i74.PageRouteInfo<void> {
  const RecieveRoute({List<_i74.PageRouteInfo>? children})
      : super(
          RecieveRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecieveRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i51.RemoveAccountDialog]
class RemoveAccountRoute extends _i74.PageRouteInfo<void> {
  const RemoveAccountRoute({List<_i74.PageRouteInfo>? children})
      : super(
          RemoveAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'RemoveAccountRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i52.RemoveLiquidityPageWrapper]
class RemoveLiquidityRouteWrapper
    extends _i74.PageRouteInfo<RemoveLiquidityRouteWrapperArgs> {
  RemoveLiquidityRouteWrapper({
    required _i76.PoolFullInfo poolFullInfo,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          RemoveLiquidityRouteWrapper.name,
          args: RemoveLiquidityRouteWrapperArgs(
            poolFullInfo: poolFullInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RemoveLiquidityRouteWrapper';

  static const _i74.PageInfo<RemoveLiquidityRouteWrapperArgs> page =
      _i74.PageInfo<RemoveLiquidityRouteWrapperArgs>(name);
}

class RemoveLiquidityRouteWrapperArgs {
  const RemoveLiquidityRouteWrapperArgs({
    required this.poolFullInfo,
    this.key,
  });

  final _i76.PoolFullInfo poolFullInfo;

  final _i75.Key? key;

  @override
  String toString() {
    return 'RemoveLiquidityRouteWrapperArgs{poolFullInfo: $poolFullInfo, key: $key}';
  }
}

/// generated route for
/// [_i53.RenameObjectDialog]
class RenameObjectRoute extends _i74.PageRouteInfo<RenameObjectRouteArgs> {
  RenameObjectRoute({
    required _i77.Snapshot snapshot,
    required _i78.HashObject hashObject,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
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

  static const _i74.PageInfo<RenameObjectRouteArgs> page =
      _i74.PageInfo<RenameObjectRouteArgs>(name);
}

class RenameObjectRouteArgs {
  const RenameObjectRouteArgs({
    required this.snapshot,
    required this.hashObject,
    this.key,
  });

  final _i77.Snapshot snapshot;

  final _i78.HashObject hashObject;

  final _i75.Key? key;

  @override
  String toString() {
    return 'RenameObjectRouteArgs{snapshot: $snapshot, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i54.RenameSnapshotDialog]
class RenameSnapshotRoute extends _i74.PageRouteInfo<RenameSnapshotRouteArgs> {
  RenameSnapshotRoute({
    required _i77.Snapshot snapshot,
    required _i78.HashObject hashObject,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
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

  static const _i74.PageInfo<RenameSnapshotRouteArgs> page =
      _i74.PageInfo<RenameSnapshotRouteArgs>(name);
}

class RenameSnapshotRouteArgs {
  const RenameSnapshotRouteArgs({
    required this.snapshot,
    required this.hashObject,
    this.key,
  });

  final _i77.Snapshot snapshot;

  final _i78.HashObject hashObject;

  final _i75.Key? key;

  @override
  String toString() {
    return 'RenameSnapshotRouteArgs{snapshot: $snapshot, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i55.SaveHashDialog]
class SaveHashRoute extends _i74.PageRouteInfo<SaveHashRouteArgs> {
  SaveHashRoute({
    required _i77.Snapshot snapshot,
    required _i78.HashObject hashObject,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
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

  static const _i74.PageInfo<SaveHashRouteArgs> page =
      _i74.PageInfo<SaveHashRouteArgs>(name);
}

class SaveHashRouteArgs {
  const SaveHashRouteArgs({
    required this.snapshot,
    required this.hashObject,
    this.key,
  });

  final _i77.Snapshot snapshot;

  final _i78.HashObject hashObject;

  final _i75.Key? key;

  @override
  String toString() {
    return 'SaveHashRouteArgs{snapshot: $snapshot, hashObject: $hashObject, key: $key}';
  }
}

/// generated route for
/// [_i56.SaveObjectDialog]
class SaveObjectRoute extends _i74.PageRouteInfo<SaveObjectRouteArgs> {
  SaveObjectRoute({
    required _i77.Snapshot snapshot,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          SaveObjectRoute.name,
          args: SaveObjectRouteArgs(
            snapshot: snapshot,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SaveObjectRoute';

  static const _i74.PageInfo<SaveObjectRouteArgs> page =
      _i74.PageInfo<SaveObjectRouteArgs>(name);
}

class SaveObjectRouteArgs {
  const SaveObjectRouteArgs({
    required this.snapshot,
    this.key,
  });

  final _i77.Snapshot snapshot;

  final _i75.Key? key;

  @override
  String toString() {
    return 'SaveObjectRouteArgs{snapshot: $snapshot, key: $key}';
  }
}

/// generated route for
/// [_i57.ScanPage]
class ScanRoute extends _i74.PageRouteInfo<void> {
  const ScanRoute({List<_i74.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i58.ScanPageWrapper]
class ScanRouteWrapper extends _i74.PageRouteInfo<void> {
  const ScanRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          ScanRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'ScanRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i59.SectionsSubPage]
class SectionsSubRoute extends _i74.PageRouteInfo<SectionsSubRouteArgs> {
  SectionsSubRoute({
    required _i83.GlobalSettings initialState,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          SectionsSubRoute.name,
          args: SectionsSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SectionsSubRoute';

  static const _i74.PageInfo<SectionsSubRouteArgs> page =
      _i74.PageInfo<SectionsSubRouteArgs>(name);
}

class SectionsSubRouteArgs {
  const SectionsSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i83.GlobalSettings initialState;

  final _i75.Key? key;

  @override
  String toString() {
    return 'SectionsSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i60.SelectAccountPage]
class SelectAccountRoute extends _i74.PageRouteInfo<void> {
  const SelectAccountRoute({List<_i74.PageRouteInfo>? children})
      : super(
          SelectAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectAccountRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i61.SetMetadataPage]
class SetMetadataRoute extends _i74.PageRouteInfo<void> {
  const SetMetadataRoute({List<_i74.PageRouteInfo>? children})
      : super(
          SetMetadataRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetMetadataRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i62.SetMetadataPageWrapper]
class SetMetadataRouteWrapper
    extends _i74.PageRouteInfo<SetMetadataRouteWrapperArgs> {
  SetMetadataRouteWrapper({
    required int initialAssetId,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          SetMetadataRouteWrapper.name,
          args: SetMetadataRouteWrapperArgs(
            initialAssetId: initialAssetId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SetMetadataRouteWrapper';

  static const _i74.PageInfo<SetMetadataRouteWrapperArgs> page =
      _i74.PageInfo<SetMetadataRouteWrapperArgs>(name);
}

class SetMetadataRouteWrapperArgs {
  const SetMetadataRouteWrapperArgs({
    required this.initialAssetId,
    this.key,
  });

  final int initialAssetId;

  final _i75.Key? key;

  @override
  String toString() {
    return 'SetMetadataRouteWrapperArgs{initialAssetId: $initialAssetId, key: $key}';
  }
}

/// generated route for
/// [_i63.SettingsPage]
class SettingsRoute extends _i74.PageRouteInfo<void> {
  const SettingsRoute({List<_i74.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i64.StableHashSubPage]
class StableHashSubRoute extends _i74.PageRouteInfo<StableHashSubRouteArgs> {
  StableHashSubRoute({
    required _i83.GlobalSettings initialState,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          StableHashSubRoute.name,
          args: StableHashSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StableHashSubRoute';

  static const _i74.PageInfo<StableHashSubRouteArgs> page =
      _i74.PageInfo<StableHashSubRouteArgs>(name);
}

class StableHashSubRouteArgs {
  const StableHashSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i83.GlobalSettings initialState;

  final _i75.Key? key;

  @override
  String toString() {
    return 'StableHashSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i65.SwapPageWrapper]
class SwapRouteWrapper extends _i74.PageRouteInfo<void> {
  const SwapRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          SwapRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'SwapRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i66.TransBytesSubPage]
class TransBytesSubRoute extends _i74.PageRouteInfo<TransBytesSubRouteArgs> {
  TransBytesSubRoute({
    required _i83.GlobalSettings initialState,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          TransBytesSubRoute.name,
          args: TransBytesSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransBytesSubRoute';

  static const _i74.PageInfo<TransBytesSubRouteArgs> page =
      _i74.PageInfo<TransBytesSubRouteArgs>(name);
}

class TransBytesSubRouteArgs {
  const TransBytesSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i83.GlobalSettings initialState;

  final _i75.Key? key;

  @override
  String toString() {
    return 'TransBytesSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i67.TransactionsHistoryPageWrapper]
class TransactionsHistoryRouteWrapper extends _i74.PageRouteInfo<void> {
  const TransactionsHistoryRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          TransactionsHistoryRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsHistoryRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i68.TransferPage]
class TransferRoute extends _i74.PageRouteInfo<TransferRouteArgs> {
  TransferRoute({
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          TransferRoute.name,
          args: TransferRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TransferRoute';

  static const _i74.PageInfo<TransferRouteArgs> page =
      _i74.PageInfo<TransferRouteArgs>(name);
}

class TransferRouteArgs {
  const TransferRouteArgs({this.key});

  final _i75.Key? key;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i69.TransferPageWrapper]
class TransferRouteWrapper
    extends _i74.PageRouteInfo<TransferRouteWrapperArgs> {
  TransferRouteWrapper({
    required _i84.TransferMetaDTO metadata,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          TransferRouteWrapper.name,
          args: TransferRouteWrapperArgs(
            metadata: metadata,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransferRouteWrapper';

  static const _i74.PageInfo<TransferRouteWrapperArgs> page =
      _i74.PageInfo<TransferRouteWrapperArgs>(name);
}

class TransferRouteWrapperArgs {
  const TransferRouteWrapperArgs({
    required this.metadata,
    this.key,
  });

  final _i84.TransferMetaDTO metadata;

  final _i75.Key? key;

  @override
  String toString() {
    return 'TransferRouteWrapperArgs{metadata: $metadata, key: $key}';
  }
}

/// generated route for
/// [_i70.UploadedObjectWrapper]
class UploadedObjectWrapper
    extends _i74.PageRouteInfo<UploadedObjectWrapperArgs> {
  UploadedObjectWrapper({
    required int objectId,
    _i85.UploadedObject? uploadedObject,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          UploadedObjectWrapper.name,
          args: UploadedObjectWrapperArgs(
            objectId: objectId,
            uploadedObject: uploadedObject,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadedObjectWrapper';

  static const _i74.PageInfo<UploadedObjectWrapperArgs> page =
      _i74.PageInfo<UploadedObjectWrapperArgs>(name);
}

class UploadedObjectWrapperArgs {
  const UploadedObjectWrapperArgs({
    required this.objectId,
    this.uploadedObject,
    this.key,
  });

  final int objectId;

  final _i85.UploadedObject? uploadedObject;

  final _i75.Key? key;

  @override
  String toString() {
    return 'UploadedObjectWrapperArgs{objectId: $objectId, uploadedObject: $uploadedObject, key: $key}';
  }
}

/// generated route for
/// [_i71.WalletNodeSubPage]
class WalletNodeSubRoute extends _i74.PageRouteInfo<WalletNodeSubRouteArgs> {
  WalletNodeSubRoute({
    required _i83.GlobalSettings initialState,
    _i75.Key? key,
    List<_i74.PageRouteInfo>? children,
  }) : super(
          WalletNodeSubRoute.name,
          args: WalletNodeSubRouteArgs(
            initialState: initialState,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WalletNodeSubRoute';

  static const _i74.PageInfo<WalletNodeSubRouteArgs> page =
      _i74.PageInfo<WalletNodeSubRouteArgs>(name);
}

class WalletNodeSubRouteArgs {
  const WalletNodeSubRouteArgs({
    required this.initialState,
    this.key,
  });

  final _i83.GlobalSettings initialState;

  final _i75.Key? key;

  @override
  String toString() {
    return 'WalletNodeSubRouteArgs{initialState: $initialState, key: $key}';
  }
}

/// generated route for
/// [_i72.WalletPage]
class WalletRoute extends _i74.PageRouteInfo<void> {
  const WalletRoute({List<_i74.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}

/// generated route for
/// [_i73.WalletPageWrapper]
class WalletRouteWrapper extends _i74.PageRouteInfo<void> {
  const WalletRouteWrapper({List<_i74.PageRouteInfo>? children})
      : super(
          WalletRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'WalletRouteWrapper';

  static const _i74.PageInfo<void> page = _i74.PageInfo<void>(name);
}
