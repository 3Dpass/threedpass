import 'package:flutter/material.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';

class ImportAccountCreatePage extends StatelessWidget {
  const ImportAccountCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountPageTemplate.import(
      children: [],
      disableBottomButton: true,
    );
  }
}
