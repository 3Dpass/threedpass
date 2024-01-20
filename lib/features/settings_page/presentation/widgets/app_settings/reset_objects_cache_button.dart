import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/progress_indicator/thin_progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ResetObjectsCacheButton extends StatelessWidget {
  const ResetObjectsCacheButton({super.key});

  Future<void> reloadCache(final BuildContext context) async {
    final bloc = BlocProvider.of<PoscanObjectsCubit>(context);

    await bloc.clear();
    await bloc.loadAll();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      builder: (final context, final state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: D3pCard(
          cardShape: CardShape.bottom,
          child: SizedBox(
            height: 56,
            child: Row(
              children: [
                const SizedBox(width: 16),
                const Icon(
                  Icons.storage,
                  color: Colors.amber,
                ),
                const SizedBox(width: 16),
                D3pBodyMediumText(
                  'reset_objects_cache_plural'.plural(state.objects.length),
                  translate: false,
                ),
                // This structure of insided rows may seem dirty, but they are required to make things work =)
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      state.status == PoscanObjectStateStatus.loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: ThinProgressIndicator(),
                            )
                          : Flexible(
                              child: D3pTextButton(
                                // width: 105,
                                mainAxisAlignment: MainAxisAlignment.end,
                                icon: Icons.refresh,
                                text: 'Reset'.tr(),
                                onPressed: () => reloadCache(context),
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
      ),
    );
  }
}
