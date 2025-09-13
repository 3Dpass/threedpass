import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme_data.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/utils/empty_function.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/find_objects_by_hash.dart';
import 'package:threedpass/setup.dart';

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
    findObj();
  }

  AsyncValue<List<UploadedObject>> loadedObject = AsyncValue.loading();

  Future<void> findObj() => getIt<FindObjectsByHash>().safeCall(
        params: widget.snap.typedHashes,
        onError: (final Object e, final StackTrace st) => mounted
            ? setState(() => loadedObject = AsyncValue.error(e, st))
            : emptyFunction(),
        onSuccess: (final List<UploadedObject> objects) => mounted
            ? setState(() => loadedObject = AsyncValue.data(objects))
            : emptyFunction(),
      );

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: loadedObject.when<Widget>(
          data: (final List<UploadedObject> data) => FastRichText(
            mainText: 'chain_status_recognized'.tr(),
            secondaryText: 'snapshot_chain_status'.tr(),
            needSpace: true,
            mainTextColor: D3pThemeData.mainColor,
          ),
          error: (Object error, StackTrace stackTrace) => Icon(Icons.error),
          loading: () => D3pProgressIndicator(size: 12),
        ),
      );
}
