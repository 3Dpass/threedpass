import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:unicons/unicons.dart';

class PreviewAppBar extends PlatformAppBar {
  PreviewAppBar({
    // required final Snapshot snapshot,
    required final ThemeData themeData,
    required final BuildContext context,
    required final PreviewSnapshotType psType,
    final Key? key,
    final HashObject? hashObject,
  }) : super(
          key: key,
          backgroundColor: const D3pAppBarTheme().backgroundColor,
          material: (final _, final __) => MaterialAppBarData(
            titleSpacing: 0,
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PlatformIconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  _getIconData(context),
                  color: themeData.customColors.appBarButton,
                ),
                onPressed: () => context.router.pop(),
              ),
              _PreviewAppbarTitle(
                hashObject: hashObject,
              ),
              // _PseudoButtonSavedIndicator(psType),
              const D3pIconButton.fake(),
            ],
          ),
        );

  static IconData _getIconData(final BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Icons.arrow_back_ios;
    }
  }
}

class _PreviewAppbarTitle extends StatelessWidget {
  const _PreviewAppbarTitle({
    required this.hashObject,
    // required this.psType,
  });

  final HashObject? hashObject;

  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);
    return hashObject != null
        ? Flexible(
            child: Text(
              hashObject!.name,
              overflow: TextOverflow.ellipsis,
              style: themeData.customTextStyles.appBarTextBright,
            ),
          )
        : Text(
            'unsaved_object_appbar'.tr(),
            style: themeData.customTextStyles.appBarTextBright,
          );
  }
}

class _PseudoButtonSavedIndicator extends StatelessWidget {
  final PreviewSnapshotType psType;

  const _PseudoButtonSavedIndicator(this.psType);

  @override
  Widget build(final BuildContext context) {
    return D3pIconButton(
      iconData: psType == PreviewSnapshotType.existingSnapshot
          ? UniconsLine.file_check
          : UniconsLine.file_exclamation,
    );
  }
}
