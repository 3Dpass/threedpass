import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/clear_local_cache.dart';
import 'package:threedpass/setup.dart';

class ResetObjectsCacheButton extends StatefulWidget {
  const ResetObjectsCacheButton({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ResetObjectsCacheButton> {
  Future<void> clearCache(final BuildContext context) =>
      getIt<ClearLocalCache>().safeCall(
        params: null,
        onError: (final e, final st) => Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
        ),
        onSuccess: (final void _) {
          Fluttertoast.showToast(
            msg: 'reset_objects_cache_success'.tr(),
          );
        },
      );

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: D3pCard(
        cardShape: CardShape.bottom,
        child: SizedBox(
          height: 56,
          child:
              // TODO print cached objects count and maybe size
              // cachedCount == null
              //     ? const Center(
              //         child: D3pProgressIndicator(
              //           strokeWidth: 2,
              //           size: 20,
              //         ),
              //       )
              //     :
              Row(
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
                  D3pBodyMediumText('clear_local_obj_cache'
                      // 'reset_objects_cache_plural'.tr(
                      //   args: ['objects_plural'.plural(cachedCount!)],
                      // ),
                      // translate: false,
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
  }
}
