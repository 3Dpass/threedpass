import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/algorithm.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/custom_select_settings_subpage.dart';

@RoutePage()
class ChooseAlgorithmSubPage extends CustomSelectSettingsSubPage {
  const ChooseAlgorithmSubPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends CustomSelectSettingsSubPageState<String> {
  _State();

  @override
  void initState() {
    final settings = BlocProvider.of<SettingsConfigCubit>(context).state;
    chosenValue = ValueNotifier(settings.scanSettings.algorithm);
    super.initState();
  }

  @override
  final String appbarTitle = 'choose_algorithm_label';

  @override
  Widget bodyBuilderOverride(final BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: AlgorithmMaster.list.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final context, final index) => EnumButton(
        text: AlgorithmMaster.list[index],
        isChosen: AlgorithmMaster.list[index] == chosenValue.value,
        onPressed: () => onPressed(context, index),
      ),
    );
  }

  @override
  late final ValueNotifier<String> chosenValue;

  void onPressed(final BuildContext context, final int index) {
    setState(() {
      chosenValue.value = AlgorithmMaster.list[index];
      final newValue = chosenValue.value;
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);

      final newScanConfig =
          cubit.state.scanSettings.copyWith(algorithm: newValue);
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    });
  }
}
