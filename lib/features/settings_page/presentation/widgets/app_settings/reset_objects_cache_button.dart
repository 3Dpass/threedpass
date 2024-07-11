import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/progress_indicator/thin_progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ResetObjectsCacheButton extends StatefulWidget {
  const ResetObjectsCacheButton({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ResetObjectsCacheButton> {
  int? cachedObjects;

  @override
  void initState() {
    super.initState();
//  BlocProvider.of<PoscanObjectsCubit>(context).store.
//     objectsChanged.asBroadcastStream()
  }

  // TODO Reload after cache update or don't save navigation pages in context
  Future<void> loadCachedObjects() async {
    try {
      final count = await BlocProvider.of<PoscanObjectsCubit>(context)
          .store
          .countEntries();

      setState(() {
        cachedObjects = count;
      });
    } on Object catch (e) {
      logE(e, StackTrace.current);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> clearCache(final BuildContext context) async {
    final bloc = BlocProvider.of<PoscanObjectsCubit>(context);

    await bloc.clear();
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
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: ThinProgressIndicator(),
                      ),
                    )
                  : Row(
                      children: [
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.storage,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 16),
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
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Spacer(),
                              Flexible(
                                child: D3pTextButton(
                                  // width: 105,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  icon: Icons.clear,
                                  text: 'Clear'.tr(),
                                  onPressed: cachedObjects != null
                                      ? () => clearCache(context)
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
