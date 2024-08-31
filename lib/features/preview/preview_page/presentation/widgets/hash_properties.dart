import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/copy_text_card.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_text.dart';

class ScanProperties extends StatelessWidget {
  const ScanProperties({
    required this.snapshot,
    final Key? key,
  }) : super(key: key);

  final Snapshot snapshot;

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CopyTextCard(
            textToCopy: snapshot.settingsConfig.toRawString(),
            textToShow: 'scan_properties_copied_toast'.tr(),
            child: Text.rich(snapshot.settingsConfig.toText(context)),
          ),
          D3pTextButton(
            text: 'copy_rotation_bytes'.tr(),
            onPressed:
                snapshot.settingsConfig.transBytesMode == TransBytesMode.none
                    ? null
                    : () => copyAndNotify(
                          textToCopy: snapshot.settingsConfig.transBytes,
                          textToShow: 'trans_bytes_copied_toast'.tr(),
                        ),
          ),
        ],
      ),
    );
  }
}
