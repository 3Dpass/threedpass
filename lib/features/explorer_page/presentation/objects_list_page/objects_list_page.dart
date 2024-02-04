import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/features/explorer_page/presentation/objects_list_page/objects_list_appbar.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list.dart';

@RoutePage()
class ObjectsListPage extends StatelessWidget {
  const ObjectsListPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      // appBar:
      body: Column(
        children: [
          BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
            builder: (final context, final state) => ObjectsListAppbar(
              objectsCount: state.storageCount ?? state.objects.length,
            ),
          ),
          Flexible(
            child: UploadedObjectsList(
              showHeader: false,
              filter: (final object) => true,
            ),
          ),
        ],
      ),
    );
  }
}
