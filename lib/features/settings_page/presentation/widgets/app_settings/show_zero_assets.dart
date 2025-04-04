import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';

class ShowZeroAssets extends StatelessWidget {
  const ShowZeroAssets({final Key? key}) : super(key: key);

  void onChanged(final bool newValue, final BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    final newAppSettings =
        cubit.state.appSettings.copyWith(showZeroAssets: newValue);
    final newState = cubit.state.copyWith(appSettings: newAppSettings);
    cubit.updateSettings(newState);
  }

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: BlocBuilder<SettingsCubit, GlobalSettings>(
        buildWhen: (final previous, final current) =>
            previous.appSettings.showZeroAssets !=
            current.appSettings.showZeroAssets,
        builder: (final context, final state) => LineButton(
          icon: const Icon(
            Icons.exposure_zero_outlined,
            color: Colors.green,
          ),
          localization_key: 'show_all_assets_label',
          goToBasicRight: LineButtonRightBool(
            onChange: (final bool p0) => onChanged(p0, context),
            value: state.appSettings.showZeroAssets,
          ),
          onBasePressed: null,
          cardShape: CardShape.middle,
        ),
      ),
    );
  }
}
