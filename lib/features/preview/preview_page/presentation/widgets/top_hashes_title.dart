import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/preview/preview_page/presentation/widgets/section_title.dart';

class TopHashesTitle extends StatelessWidget {
  const TopHashesTitle({super.key});

  @override
  Widget build(final BuildContext context) {
    final snapshot = BlocProvider.of<PreviewPageCubit>(context).state;
    final title_str =
        snapshot.withEmptyHashes ? 'no_top_hashes_found' : 'top_hashes_title';

    return SectionTitle(titleUnlocalized: title_str);
  }
}
