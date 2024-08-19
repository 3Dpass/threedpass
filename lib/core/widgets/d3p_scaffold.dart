import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class D3pScaffold extends StatelessWidget {
  final Widget body;
  final String? appBarTitle;
  final Widget? appBarWidget;
  final bool translateAppbar;
  final Widget? floatingActionButton;
  final Widget? appBarLeading;
  final List<Widget>? appBarActions;

  const D3pScaffold({
    required this.body,
    this.appBarTitle,
    this.appBarWidget,
    this.floatingActionButton,
    this.translateAppbar = true,
    this.appBarLeading,
    this.appBarActions,
    super.key,
  }) : assert(appBarTitle != null || appBarWidget != null,
            'Either appbarTitle or appBarWidget must be provided');

  @override
  Widget build(final BuildContext context) {
    final appBarText = appBarWidget ??
        Text(translateAppbar ? appBarTitle!.tr() : appBarTitle!);

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: appBarLeading,
          middle: appBarText,
          trailing: appBarActions != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: appBarActions!,
                )
              : null,
        ),
        child: floatingActionButton != null
            ? Stack(
                children: [
                  body,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: floatingActionButton,
                    ),
                  ),
                ],
              )
            : body,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: appBarText,
          leading: appBarLeading,
          actions: appBarActions,
        ),
        body: body,
        floatingActionButton: floatingActionButton,
      );
    }
  }
}
