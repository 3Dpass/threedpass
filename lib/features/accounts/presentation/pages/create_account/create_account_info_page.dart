import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/router/router.gr.dart';

class CreateAccountInfoPage extends StatelessWidget {
  const CreateAccountInfoPage({final Key? key}) : super(key: key);

  /// There is an opportunity to generage menmonic using [key] seed
  Future<void> onNextPressed(
    final BuildContext context, [
    final String key = '',
  ]) async {
    final service = context.read<AppService>();

    BlocProvider.of<AccountStoreBloc>(context).add(
      GenerateMnemonicKey(service),
    );

    unawaited(
      context.router.push(
        const MnemonicBackupRoute(),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return AccountPageTemplate.create(
      children: <Widget>[
        HeaderInfo(text: 'create_warn1_header'.tr()),
        TextInfo(
          text: 'create_warn1_text'.tr(),
          bigBottomPadding: true,
        ),
        HeaderInfo(text: 'create_warn2_header'.tr()),
        TextInfo(
          text: 'create_warn2_text'.tr(),
          bigBottomPadding: false,
        ),
        TextInfo(
          text: 'create_warn2_text2'.tr(),
          bigBottomPadding: true,
        ),
        HeaderInfo(text: 'create_warn3_header'.tr()),
        TextInfo(
          text: 'create_warn3_text'.tr(),
          bigBottomPadding: false,
        ),
        TextInfo(
          text: 'create_warn3_text2'.tr(),
          bigBottomPadding: true,
        ),
        HeaderInfo(text: 'create_warn4_header'.tr()),
        TextInfo(
          text: 'create_warn4_text'.tr(),
          bigBottomPadding: true,
        ),
      ],
      onSubmitPressed: (final _) => onNextPressed(context),
    );
  }
}

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    required this.text,
    final Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(final BuildContext context) {
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

class TextInfo extends StatelessWidget {
  const TextInfo({
    required this.text,
    required this.bigBottomPadding,
    final Key? key,
  }) : super(key: key);

  final bool bigBottomPadding;
  final String text;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bigBottomPadding ? 32 : 5),
      child: Text(
        text,
      ),
    );
  }
}
