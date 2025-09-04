import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/remote_objects_count_cubit.dart';

class ResetObjectsCacheButton extends StatefulWidget {
  const ResetObjectsCacheButton({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ResetObjectsCacheButton> {
  Future<void> clearCache(final BuildContext context) =>
      BlocProvider.of<PoscanObjectsCubit>(context).clearLocalCache();

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      builder: (final context, final state) {
        // if (!state.isLoading) {
        //   loadCachedObjects();
        // }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: D3pCard(
            cardShape: CardShape.bottom,
            child: SizedBox(
              height: 56,
              child: state.isLoading
                  ? const Center(
                      child: D3pProgressIndicator(
                        strokeWidth: 2,
                        size: 20,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const W16(),
                            const Icon(
                              Icons.storage,
                              color: Colors.amber,
                            ),
                            const W16(),
                            D3pBodyMediumText(
                              'reset_objects_cache_plural'.tr(
                                args: [
                                  state.storageCount != null
                                      ? 'objects_plural'
                                          .plural(state.storageCount!)
                                      : '...',
                                ],
                              ),
                              translate: false,
                            ),
                          ],
                        ),
                        D3pTextButton(
                          // width: 105,
                          mainAxisAlignment: MainAxisAlignment.end,
                          icon: Icons.clear,
                          text: 'Clear'.tr(),
                          onPressed: () => clearCache(context),
                        ),
                      ],
                      // const SizedBox(width: 16),
                    ),
            ),
          ),
        );
      },
    );
  }
}
