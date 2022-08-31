import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';

class ScanSettingsTitle extends StatelessWidget {
  const ScanSettingsTitle({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final libVersion = BlocProvider.of<SettingsConfigCubit>(context)
        .state
        .scanSettings
        .libVersion;

    return Text.rich(
      TextSpan(
        text: 'hash_settings_title'.tr() + ' ',
        style: Theme.of(context).textTheme.headline6,
        children: [
          TextSpan(
            text: 'lib version: ' + libVersion,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
