import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/scan_page/bloc/scan_isolate_cubit.dart';

class ScanIndicator extends StatelessWidget {
  const ScanIndicator({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ScanIsolateCubit, ScanIsolateData?>(
      builder: (final context, final state) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: state != null
            ? Column(
                children: [
                  const SizedBoxH8(),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      const SizedBox(width: 16),
                      const D3pBodyLargeText('Scanning...'),
                      const Spacer(),
                      Flexible(
                        child: D3pTextButton(
                          text: 'Cancel',
                          onPressed: () =>
                              BlocProvider.of<ScanIsolateCubit>(context)
                                  .setNull(),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const Divider(),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
