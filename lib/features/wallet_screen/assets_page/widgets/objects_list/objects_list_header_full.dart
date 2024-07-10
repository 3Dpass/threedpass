import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/text/d3p_title_large_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ObjectsListHeaderFull extends StatelessWidget {
  const ObjectsListHeaderFull({
    super.key,
  });

  Future<void> refreshObjectsList(final BuildContext context) async {
    final objectsCubit = BlocProvider.of<PoscanObjectsCubit>(context);
    await objectsCubit.clear();
    return objectsCubit.pagingController.refresh();
  }

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const D3pTitleLargeText('objects_list_header'),
        D3pIconButton(
          iconData: Icons.refresh,
          onPressed: () => refreshObjectsList(context),
        ),
      ],
    );
  }
}
