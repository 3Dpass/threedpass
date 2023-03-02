import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/home_page/presentation/home_nav_bar.dart';
import 'package:threedpass/router/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<HomeContextCubit>(
      create: (final context) => HomeContextCubit(
        HomeContextState(context: context),
      ),
      child: AutoTabsRouter(
        routes: const [
          ScanWrapperRoute(),
          WalletWrapperRoute(),
          SettingsRoute(),
        ],
        builder: HomeNavBar().build,
      ),
    );
  }
}
