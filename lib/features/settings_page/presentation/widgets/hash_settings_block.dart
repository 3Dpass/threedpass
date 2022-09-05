import 'package:flutter/material.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/grid_size_dropdown.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/hash_settings_title.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/sections_textfield.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings/trans_bytes.dart';

class HashSettingsBlock extends StatelessWidget {
  const HashSettingsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScanSettingsTitle(),
        // AlgorithmDropdown(),
        const GridSizeDropdown(),
        const SectionsTextField(),
        TransBytesInput(),
        const SizedBox(height: 16),
      ],
    );
  }
}
