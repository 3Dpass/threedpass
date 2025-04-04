import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage(name: 'ChooseDateTimeRoute')
class D3pChooseDateTimeModal extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(DateTime)? onDone;
  final void Function()? onCancel;

  D3pChooseDateTimeModal({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDone,
    this.onCancel,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<D3pChooseDateTimeModal> {
  DateTime? state;

  @override
  Widget build(BuildContext context) {
    // final locale = Localizations.localeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        H16(),
        Row(
          children: [
            W16(),
            D3pTextButton(
              text: 'Cancel'.tr(),
              onPressed: () => context.router.maybePop(),
            ),
            Spacer(),
            D3pTextButton(
              text: 'Done'.tr(),
              onPressed: state != null
                  ? () {
                      widget.onDone?.call(state!);
                      context.router.maybePop();
                    }
                  : null,
            ),
            W16(),
          ],
        ),
        Flexible(
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: (DateTime newDate) => setState(() {
              state = newDate;
            }),
            initialDateTime: widget.initialDate,
            minimumDate: widget.firstDate,
            maximumDate: widget.lastDate,
            use24hFormat: true,
          ),
        ),
      ],
    );
  }
}

final AutoRoute dateTimeRoute = ModalBottomSheetAutoRoute(
  page: ChooseDateTimeRoute.page,
  enableDrag: true,
);
