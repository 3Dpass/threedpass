import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_string_appbar.dart';

class CreateAccountPageTemplate extends StatelessWidget {
  const CreateAccountPageTemplate({
    Key? key,
    required this.children,
    this.onSubmitPressed,
    this.submitButton,
  })  :
        // Next page or [submitButton] implementation has to be provided
        assert(onSubmitPressed != null || submitButton != null),
        super(key: key);

  final void Function()? onSubmitPressed;
  final List<Widget> children;
  final Widget? submitButton;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CommonStringAppbar(title: 'create_account_title'.tr()),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 36, top: 12),
                child: onSubmitPressed != null
                    ? ElevatedButton(
                        onPressed: onSubmitPressed,
                        child: Text('Next'.tr()),
                      )
                    : submitButton,
              ),
            ],
          ),
        ),
      );
}
