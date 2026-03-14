import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/when_widget.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/explorer_page/objects_list_page/presentation/objects_list_appbar.dart';
import 'package:threedpass/features/explorer_page/objects_list_page/presentation/reload_objects_icon_button.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/remote_objects_count_cubit.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_item_wrapper.dart';

@RoutePage()
class ObjectsListPage extends StatelessWidget {
  const ObjectsListPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      body: BlocBuilder<RemoteObjectsCountCubit, RemoteObjectsCountState>(
        builder: (final context, final state) => state.whenWidget(
          data: (final int count) => ListView.separated(
            itemBuilder: (final context, final index) => SizedBox(
              height: 386,
              child: ObjectsListItemWrapper(
                id: count - 1 - index,
              ),
            ),
            separatorBuilder: (_, __) => H16(),
            itemCount: count,
            padding: EdgeInsets.all(16),
          ),
        ),
      ),
      appBarWidget: const ObjectsListAppbar(),
      appBarActions: [const ReloadObjectsIconButton()],
    );
  }
}
