part of '../create_account_from_object.dart';

class _ObjectAccountInfo {
  const _ObjectAccountInfo();

  List<Widget> warnInfo() => [
        HeaderInfo(
          text: 'create_warn5_header'.tr(),
        ),
        TextInfo(
          text: 'create_warn5_text'.tr(),
          bigBottomPadding: true,
        ),
        HeaderInfo(
          text: 'create_warn6_header'.tr(),
        ),
        TextInfo(
          text: 'create_warn6_text'.tr(),
          bigBottomPadding: false,
        ),
        TextInfo(
          text: 'create_warn6_text2'.tr(),
          bigBottomPadding: false,
        ),
      ];
}
