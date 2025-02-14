import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';

class AccountPageTemplate extends StatelessWidget {
  const AccountPageTemplate({
    required this.children,
    required this.appbarTitle,
    final Key? key,
    this.onSubmitPressed,
    this.submitButton,
    this.disableScrolling,
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
    this.disableScrolling,
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
    this.disableScrolling,
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
  final bool? disableScrolling;

  @override
  Widget build(final BuildContext context) => D3pScaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ListView(
                  physics: disableScrolling ?? false
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      vertical: 16, horizontal: needHorizontalPadding ? 16 : 0),
                  children: children,
                ),
              ),
              disableBottomButton
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 12,
                        right: 16,
                        bottom: 36,
                      ),
                      child: onSubmitPressed != null
                          ? SizedBox(
                              width: double.infinity,
                              child: D3pElevatedButton(
                                text: 'Next'.tr(),
                                onPressed: () => onSubmitPressed!(context),
                              ),
                            )
                          : submitButton,
                    ),
            ],
          ),
        ),
        appBarTitle: appbarTitle,
        appBarLeading: const CustomBackButton(),
      );
}

class AccountAppbarTitle {
  static const String create = 'create_account_title';
  static const String import = 'import_account_title';
}
