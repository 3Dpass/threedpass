import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/router/router.gr.dart';

class CreateAccountInfoPage extends StatelessWidget {
  const CreateAccountInfoPage({Key? key}) : super(key: key);

  /// There is an opportunity to generage menmonic using [key] seed
  Future<void> onNextPressed(BuildContext context, [String key = '']) async {
    final service = context.read<AppService>();

    BlocProvider.of<AccountStoreBloc>(context).add(
      GenerateMnemonicKey(service),
    );
    context.router.push(
      const MnemonicBackupRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AccountPageTemplate.create(
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
      onSubmitPressed:
          // () => context.router.push(
          //   const MnemonicBackupRoute(),
          // ),
          () => onNextPressed(context),
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

  final bool bigBottomPadding;
  final String text;

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
