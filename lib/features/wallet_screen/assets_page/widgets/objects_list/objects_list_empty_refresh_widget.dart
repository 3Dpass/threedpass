import 'package:flutter/widgets.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_header_full.dart';

class ObjectsListEmptyRefresh extends StatelessWidget {
  const ObjectsListEmptyRefresh({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBoxH16(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ObjectsListHeaderFull(),
        ),
        Padding16(
          child: D3pBodyMediumText('no_owned_objects_found'),
        ),
      ],
    );
  }
}
