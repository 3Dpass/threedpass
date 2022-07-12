import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/matches_found/match_hyperlink.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NoMatchesFoundText extends StatelessWidget {
  const NoMatchesFoundText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MatchHyperlink(
      mainText: plural('MATCHES_number_plural', 0),
      clickable: 'WHY_not_found'.tr(),
      onTap: () => launchUrlString(
        'https://3dpass.org/features.html#3D_object_recognition',
      ),
    );
  }
}
