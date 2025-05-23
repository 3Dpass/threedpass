import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_theme_data.dart';
import 'package:threedpass/core/utils/empty_function.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class ChainStatus extends StatefulWidget {
  const ChainStatus({required this.snap, super.key});

  final Snapshot snap;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ChainStatus> {
  @override
  void initState() {
    super.initState();

    final objectsCubit = BlocProvider.of<PoscanObjectsCubit>(context);
    objectsCubit.stream.listen((final _) {
      if (!objectsCubit.state.areOwnerObjectsLoading) {
        findObj();
      }
    });

    findObj();
  }

  UploadedObject? loadedObject;

  Future<void> findObj() async {
    loadedObject = await BlocProvider.of<PoscanObjectsCubit>(context)
        .findObjectByHashes(widget.snap.hashesWithPrefix);
    if (mounted) {
      setState(emptyFunction);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      builder: (final context, final state) {
        if (loadedObject != null) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FastRichText(
                  mainText: 'chain_status_recognized'.tr(),
                  secondaryText: 'snapshot_chain_status'.tr(),
                  needSpace: true,
                  mainTextColor: D3pThemeData.mainColor));
        } else {
          return const SizedBox();
        }
      },
      buildWhen: (final previous, final current) =>
          previous.areOwnerObjectsLoading != current.areOwnerObjectsLoading,
    );
  }
}
