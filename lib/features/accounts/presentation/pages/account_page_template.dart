import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_string_appbar.dart';

class AccountPageTemplate extends StatelessWidget {
  const AccountPageTemplate.create({
    Key? key,
    required this.children,
    this.onSubmitPressed,
    this.submitButton,
    this.disableBottomButton = false,
  })  :
        // Next page or [submitButton] implementation has to be provided
        assert(onSubmitPressed != null || submitButton != null),
        appbarTitle = 'create_account_title',
        super(key: key);

  const AccountPageTemplate.import({
    Key? key,
    required this.children,
    this.onSubmitPressed,
    this.submitButton,
    this.disableBottomButton = false,
  })  :
        // Next page or [submitButton] implementation has to be provided
        assert(onSubmitPressed != null ||
            submitButton != null ||
            disableBottomButton),
        appbarTitle = 'import_account_title',
        super(key: key);

  final void Function(BuildContext)? onSubmitPressed;
  final List<Widget> children;
  final Widget? submitButton;
  final String appbarTitle;
  final bool disableBottomButton;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CommonStringAppbar(title: appbarTitle.tr()),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
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
                              child: ElevatedButton(
                                onPressed: () => onSubmitPressed!(context),
                                child: Text('Next'.tr()),
                              ),
                            )
                          : submitButton,
                    ),
            ],
          ),
        ),
      );
}
