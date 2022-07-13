import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_appbar.dart';

class CommonStringAppbar extends CommonAppbar {
  CommonStringAppbar({Key? key, required String title})
      : super(
          key: key,
          title: Text(title),
        );
}
