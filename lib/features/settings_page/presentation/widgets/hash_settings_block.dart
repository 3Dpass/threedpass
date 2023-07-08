import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/algorithm_button.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/grid_size_button.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/hash_settings_title.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/sections_button.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/trans_bytes_button.dart';

class HashSettingsBlock extends StatelessWidget {
  const HashSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ScanSettingsTitle(),
        AlgorithmButton(),
        GridSizeButton(),
        SectionsButton(),
        TransBytesButton(),
      ],
    );
  }
}
