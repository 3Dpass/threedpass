import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_string_appbar.dart';
import 'package:threedpass/router/router.gr.dart';

class CreateAccountInfoPage extends StatelessWidget {
  const CreateAccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonStringAppbar(title: 'create_account_title'.tr()),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  _Header(text: 'create_warn1_header'.tr()),
                  _UsualText(
                    text: 'create_warn1_text'.tr(),
                    bigBottomPadding: true,
                  ),
                  _Header(text: 'create_warn2_header'.tr()),
                  _UsualText(
                    text: 'create_warn2_text'.tr(),
                    bigBottomPadding: false,
                  ),
                  _UsualText(
                    text: 'create_warn2_text2'.tr(),
                    bigBottomPadding: true,
                  ),
                  _Header(text: 'create_warn3_header'.tr()),
                  _UsualText(
                    text: 'create_warn3_text'.tr(),
                    bigBottomPadding: false,
                  ),
                  _UsualText(
                    text: 'create_warn3_text2'.tr(),
                    bigBottomPadding: true,
                  ),
                  _Header(text: 'create_warn4_header'.tr()),
                  _UsualText(
                    text: 'create_warn4_text'.tr(),
                    bigBottomPadding: true,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => context.router.push(const MnemonicGenRoute()),
              child: Text('Next'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _UsualText extends StatelessWidget {
  const _UsualText({
    Key? key,
    required this.text,
    required this.bigBottomPadding,
  }) : super(key: key);

  final String text;
  final bool bigBottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bigBottomPadding ? 32 : 5),
      child: Text(
        text,
      ),
    );
  }
}
