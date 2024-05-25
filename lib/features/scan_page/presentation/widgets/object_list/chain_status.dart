import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ChainStatus extends StatelessWidget {
  const ChainStatus({required this.snap, super.key});

  final Snapshot snap;

  @override
  Widget build(final BuildContext context) {
    final loadedObject = BlocProvider.of<PoscanObjectsCubit>(context)
        .findObjectByHashes(snap.hashes);
    if (loadedObject != null) {
      final medium = Theme.of(context)
          .customTextStyles
          .d3pBodyMedium
          .copyWith(color: D3pThemeData.mainColor);

      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: FastRichText(
          mainText: 'chain_status_recognized'.tr(),
          secondaryText: 'snapshot_chain_status'.tr(),
          needSpace: true,
          mainTextStyle: medium,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
