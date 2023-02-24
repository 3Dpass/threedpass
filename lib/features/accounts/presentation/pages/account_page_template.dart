import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';

class AccountPageTemplate extends StatelessWidget {
  const AccountPageTemplate({
    required this.children,
    required this.appbarTitle,
    final Key? key,
    this.onSubmitPressed,
    this.submitButton,
    this.disableBottomButton = false,
    final bool? needHorizontalPadding,
  })  : assert(
          onSubmitPressed != null ||
              submitButton != null ||
              disableBottomButton,
          'Something about submit button has to be provided',
        ),
        needHorizontalPadding = needHorizontalPadding ?? true,
        super(key: key);

  const AccountPageTemplate.create({
    required this.children,
    final Key? key,
    this.onSubmitPressed,
    this.submitButton,
    this.disableBottomButton = false,
    final bool? needHorizontalPadding,
  })  : assert(
          onSubmitPressed != null ||
              submitButton != null ||
              disableBottomButton,
          'Something about submit button has to be provided',
        ),
        appbarTitle = AccountAppbarTitle.create,
        needHorizontalPadding = needHorizontalPadding ?? true,
        super(key: key);

  const AccountPageTemplate.import({
    required this.children,
    final Key? key,
    this.onSubmitPressed,
    this.submitButton,
    this.disableBottomButton = false,
    final bool? needHorizontalPadding,
  })  :
        // Next page or [submitButton] implementation has to be provided
        assert(
          onSubmitPressed != null ||
              submitButton != null ||
              disableBottomButton,
          'Something about submit button has to be provided',
        ),
        appbarTitle = AccountAppbarTitle.import,
        needHorizontalPadding = needHorizontalPadding ?? true,
        super(key: key);

  final void Function(BuildContext)? onSubmitPressed;
  final String appbarTitle;
  final List<Widget> children;
  final bool disableBottomButton;
  final bool needHorizontalPadding;
  final Widget? submitButton;

  @override
  Widget build(final BuildContext context) => D3pScaffold(
        // TODO Add back button in case first page of import or generation
        appbarTitle: appbarTitle,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ListView(
                  // physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: needHorizontalPadding ? 16 : 0,
                  ),
                  shrinkWrap: true,
                  children: children,
                ),
              ),
              disableBottomButton
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(
                        bottom: 36,
                        top: 12,
                        left: 16,
                        right: 16,
                      ),
                      child: onSubmitPressed != null
                          ? SizedBox(
                              width: double.infinity,
                              child: D3pElevatedButton(
                                onPressed: () => onSubmitPressed!(context),
                                text: 'Next'.tr(),
                              ),
                            )
                          : submitButton,
                    ),
            ],
          ),
        ),
      );
}

class AccountAppbarTitle {
  static const String create = 'create_account_title';
  static const String import = 'import_account_title';
}
