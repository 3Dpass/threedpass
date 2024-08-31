import 'package:flutter/material.dart';

class D3pBottomSheetThemeData extends BottomSheetThemeData {
  const D3pBottomSheetThemeData()
      : super(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        );
}
