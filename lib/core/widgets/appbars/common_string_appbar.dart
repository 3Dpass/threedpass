import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/app_back_button.dart';
import 'package:threedpass/core/widgets/appbars/common_appbar.dart';

class CommonStringAppbar extends CommonAppbar {
  CommonStringAppbar({
    required final String title,
    required final ThemeData theme,
    final Key? key,
  }) : super(
          key: key,
          theme: theme,
          titleSpacing: 0,
          title: SizedBox(
            height: kToolbarHeight,
            child: Stack(
              children: [
                const AppBackButton(),
                Align(
                  child: Text(title),
                ),
              ],
            ),
          ),
        );
}
