import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/algorithm.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/grid_size.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/custom_select_settings_subpage.dart';

@RoutePage()
class GridSizeSubPage extends CustomSelectSettingsSubPage {
  const GridSizeSubPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends CustomSelectSettingsSubPageState<int> {
  _State();

  @override
  void initState() {
    final settings = BlocProvider.of<SettingsCubit>(context).state;
    chosenValue = ValueNotifier(settings.scanSettings.gridSize);
    super.initState();
  }

  @override
  final String appbarTitle = 'grid_size_label';

  @override
  Widget bodyBuilderOverride(final BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: AlgorithmMaster.list.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final context, final index) {
        final v = GridSizeMaster.list[index];
        final string = '${v}x${v}';
        return RadioListTile.adaptive(
          title: Text(string),
          value: v,
          groupValue: chosenValue.value,
          onChanged: (_) => onPressed(context, index),
        );
      },
    );
  }

  @override
  late final ValueNotifier<int> chosenValue;

  void onPressed(final BuildContext context, final int index) {
    setState(() {
      chosenValue.value = GridSizeMaster.list[index];
      final newValue = chosenValue.value;
      final cubit = BlocProvider.of<SettingsCubit>(context);

      final newScanConfig =
          cubit.state.scanSettings.copyWith(gridSize: newValue);
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    });
  }
}
