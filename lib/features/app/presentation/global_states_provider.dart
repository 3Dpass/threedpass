import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/connection/polkadot/bloc/polkadot_node_url.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/scan_page/bloc/scan_isolate_cubit.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/setup.dart' as di_setup;

class GlobalStatesProvider extends StatelessWidget {
  const GlobalStatesProvider({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HashesListBloc>(
          create: (final _) => di_setup.getIt<HashesListBloc>(),
        ),
        BlocProvider<ContactsBloc>(
          create: (final _) => di_setup.getIt<ContactsBloc>(),
        ),
        BlocProvider<SettingsCubit>(
          create: (final _) => di_setup.getIt<SettingsCubit>(),
        ),
        BlocProvider<AppServiceLoaderCubit>(
          create: (final _) => di_setup.getIt<AppServiceLoaderCubit>(),
          lazy: false,
        ),
        BlocProvider<ScanIsolateCubit>(
          create: (final _) => ScanIsolateCubit(),
        ),
        BlocProvider<PoscanObjectsCubit>(
          create: (final _) => di_setup.getIt<PoscanObjectsCubit>(),
          lazy: false,
        ),
        BlocProvider<NotificationsBloc>(
          create: (final _) => di_setup.getIt<NotificationsBloc>(),
        ),
        BlocProvider<PoscanAssetsCubit>(
          create: (final _) => di_setup.getIt<PoscanAssetsCubit>(),
        ),
        BlocProvider<PoolsCubit>(
          create: (final _) => di_setup.getIt<PoolsCubit>(),
        ),
        BlocProvider<PolkadotNodeUrl>(
          create: (final _) => di_setup.getIt<PolkadotNodeUrl>(),
        ),
      ],
      child: child,
    );
  }
}
