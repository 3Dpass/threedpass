part of '../create_account_from_object.dart';

class _ChooseHashTitle extends StatelessWidget {
  const _ChooseHashTitle();

  @override
  Widget build(final BuildContext context) => Text.rich(
        TextSpan(
          text: 'create_from_object_text2'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
          children: [
            TextSpan(
              text: '\n' + 'create_from_object_text2_hint'.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      );
}
