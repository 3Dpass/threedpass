import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/bloc/scan_isolate_cubit.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart' as di_setup;

class GlobalStatesProvider extends StatelessWidget {
  const GlobalStatesProvider({
    required this.builder,
    super.key,
  });

  final Widget Function(
    BuildContext context,
  ) builder;

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HashesListBloc>(
          create: (final _) => di_setup.getIt<HashesListBloc>(),
        ),
        BlocProvider<SettingsConfigCubit>(
          create: (final _) => di_setup.getIt<SettingsConfigCubit>(),
        ),
        BlocProvider<AppServiceLoaderCubit>(
          create: (final _) => di_setup.getIt<AppServiceLoaderCubit>(),
          lazy: false,
        ),
        BlocProvider<ScanIsolateCubit>(
          create: (final _) => ScanIsolateCubit(),
        ),
      ],
      child: PlatformProvider(
        settings: PlatformSettingsData(
          iosUsesMaterialWidgets: true,
          iosUseZeroPaddingForAppbarPlatformIcon: true,
        ),
        builder: (final context) => builder(context),
      ),
    );
  }
}
