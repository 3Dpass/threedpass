import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/scan_page/bloc/scan_isolate_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class CalcHashLoadingDialog extends StatelessWidget {
  const CalcHashLoadingDialog({
    final Key? key,
  }) : super(key: key);

  static const indicatorSize = 26.0;

  @override
  Widget build(final BuildContext context) {
    return PlatformAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: indicatorSize,
                height: indicatorSize,
                child: PlatformCircularProgressIndicator(),
              ),
              SizedBox(width: 8),
              Flexible(
                child: Container(
                  width: double.infinity,
                  // color: Colors.amber,
                  // margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    'calc_hashes_loader_text'.tr(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: indicatorSize,
              ),
            ],
          ),
          const SizedBoxH16(),
          SizedBox(
            // height: 52,
            child: BlocBuilder<ScanIsolateCubit, ScanIsolateData?>(
              buildWhen: (final previous, final current) =>
                  !(previous != null && current == null),
              builder:
                  (final BuildContext context, final ScanIsolateData? value) =>
                      D3pTextButton(
                text: 'Cancel'.tr(),
                onPressed: value != null
                    ? () {
                        // value.isolate.
                        // value.isolate
                        value.port.sendPort.send(ScanIsolateCubit.cancelMsg);
                        value.isolate.removeOnExitListener(value.port.sendPort);
                        value.isolate.kill();
                        // Isolate.exit(value.port.sendPort, 'cancel');

                        getIt<Logger>().i('Stop scan');
                        BlocProvider.of<ScanIsolateCubit>(context).setNull();
                        // context.router.pop();
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
