part of '../create_account_from_object.dart';

class _ChooseHashTitle extends StatelessWidget {
  const _ChooseHashTitle();

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Text.rich(
      TextSpan(
        text: 'create_from_object_text2'.tr(),
        style: textStyles.titleLarge,
        children: [
          TextSpan(
            text: '\n' + 'create_from_object_text2_hint'.tr(),
            style: textStyles.bodyLarge,
          ),
        ],
      ),
    );
  }
}
