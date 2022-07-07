import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/common/app_text_styles.dart';
import 'package:threedpass/features/result_page/presentation/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/result_page/presentation/widgets/object_preview.dart';
import 'package:threedpass/features/result_page/presentation/widgets/delete_object_button.dart';
import 'package:threedpass/features/result_page/presentation/widgets/hash_properties.dart';
import 'package:threedpass/features/result_page/presentation/widgets/maches_found.dart';
import 'package:threedpass/features/result_page/presentation/widgets/more_info.dart';
import 'package:threedpass/features/result_page/presentation/widgets/preview_save_button.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hashObject =
        BlocProvider.of<PreviewPageCubit>(context).state.hashObject;
    final snapshot = BlocProvider.of<PreviewPageCubit>(context).state.snapshot;

    final previewPageCubitState =
        BlocProvider.of<PreviewPageCubit>(context).state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 16,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              icon: const BackButtonIcon(),
              alignment: Alignment.centerLeft,
              // color: color,
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () => context.router.pop(),
            ),
            hashObject != null
                ? Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        hashObject.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                : const Text("Get a new one"),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.share),
              alignment: Alignment.centerRight,
              onPressed: () {
                Share.share(snapshot.shareText);
              },
            )
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              Flexible(
                child: Text.rich(
                  TextSpan(
                    text: 'Snapshot: ',
                    children: [
                      TextSpan(
                        text: snapshot.name,
                        style: AppTextStyles.bodyText1.copyWith(
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  style: AppTextStyles.bodyText2.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              MatchesFound(
                state: previewPageCubitState,
              ),
              const SizedBox(height: 8),
              ObjectPreview(
                snapshot: snapshot,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: HashProperties(
                  snapshot: snapshot,
                ),
              ),
              PreviewSaveButton(
                state: previewPageCubitState,
              ),
              DeleteSnapshotButton(
                snapshot: snapshot,
                hashObject: hashObject,
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              MoreInfo(
                snapshot: snapshot,
                hashObject: hashObject,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
