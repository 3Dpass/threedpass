import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/explorer_page/objects_list_page/presentation/explorer_uploaded_objects_list.dart';
import 'package:threedpass/features/explorer_page/objects_list_page/presentation/objects_list_appbar.dart';

@RoutePage()
class ObjectsListPage extends StatelessWidget {
  const ObjectsListPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const ObjectsListAppbar(),
        cupertino: (final context, final platform) =>
            CupertinoNavigationBarData(padding: EdgeInsetsDirectional.zero),
        material: (final context, final platform) => MaterialAppBarData(
          titleSpacing: 0,
        ),
      ),
      body: ListView(
        children: const [
          SizedBoxH16(),
          ExplorerUploadedObjectsList(),
          SizedBoxH16(),
        ],
      ),
    );
  }
}
