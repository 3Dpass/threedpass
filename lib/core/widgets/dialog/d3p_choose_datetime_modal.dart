import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage(name: 'ChooseDateTimeRoute')
class D3pChooseDateTimeModal extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(DateTime?)? onDateTimeChanged;

  D3pChooseDateTimeModal({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Text('dsadas');
  }
}

final AutoRoute dateTimeRoute = ModalBottomSheetAutoRoute(
  page: ChooseDateTimeRoute.page,
  enableDrag: true,
);
