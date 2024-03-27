import 'package:flutter/widgets.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';

class CreateAssetPage extends StatelessWidget {
  const CreateAssetPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appbarTitle: 'create_asset_page_title',
      body: Padding16(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
