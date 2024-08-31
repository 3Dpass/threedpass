import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ResetObjectsCacheButton extends StatefulWidget {
  const ResetObjectsCacheButton({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ResetObjectsCacheButton> {
  int? cachedObjects;
  bool isListenerSet = false;

  @override
  void initState() {
    super.initState();
    setListener();
  }

  Future<void> setListener() async {
    (await BlocProvider.of<PoscanObjectsCubit>(context).store.objectsChanged)
        .asBroadcastStream()
        .listen((final _) async {
      unawaited(setCount());
    });
    unawaited(setCount());
    if (mounted) {
      setState(() {
        isListenerSet = true;
      });
    }
  }

  Future<void> setCount() async {
    final count =
        await BlocProvider.of<PoscanObjectsCubit>(context).store.countEntries();
    if (mounted) {
      setState(() {
        cachedObjects = count;
      });
    }
  }

  Future<void> clearCache(final BuildContext context) async {
    final bloc = BlocProvider.of<PoscanObjectsCubit>(context);
    await bloc.store.clear();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      buildWhen: (final previous, final current) =>
          previous.isLoading != current.isLoading,
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
                            W16(),
                            const Icon(
                              Icons.storage,
                              color: Colors.amber,
                            ),
                            W16(),
                            D3pBodyMediumText(
                              'reset_objects_cache_plural'.tr(
                                args: [
                                  cachedObjects != null
                                      ? 'objects_plural'.plural(cachedObjects!)
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
                          onPressed:
                              isListenerSet ? () => clearCache(context) : null,
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
