import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/app_back_button.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class PreviewAppBar extends AppBar {
  PreviewAppBar({
    required final Snapshot snapshot,
    required final ThemeData themeData,
    final Key? key,
    final HashObject? hashObject,
  }) : super(
          key: key,
          backgroundColor: themeData.customColors.appBarBackground,
          titleSpacing: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const AppBackButton(),
              hashObject != null
                  ? Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          hashObject.name,
                          overflow: TextOverflow.ellipsis,
                          style: themeData.customTextStyles.appBarTextBright,
                        ),
                      ),
                    )
                  : Text(
                      'get_new_object_appbar'.tr(),
                      style: themeData.customTextStyles.appBarTextBright,
                    ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.share),
                color: themeData.customColors.appBarButton,
                alignment: Alignment.center,
                onPressed: () => Share.share(snapshot.shareText),
              ),
            ],
          ),
        );
}
