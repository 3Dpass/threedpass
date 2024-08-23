import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/header_info.dart';
import 'package:threedpass/features/accounts/presentation/widgets/text_info.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class CreateAccountInfoPage extends StatelessWidget {
  const CreateAccountInfoPage({final Key? key}) : super(key: key);

  /// There is an opportunity to generage menmonic using [key] seed
  Future<void> onNextPressed(
    final BuildContext context, [
    final String key = '',
  ]) async {
    BlocProvider.of<AccountStoreBloc>(context).add(
      const GenerateMnemonicKey(),
    );

    unawaited(
      context.router.push(
        const CreateAccountMnemonicBackupRoute(),
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
