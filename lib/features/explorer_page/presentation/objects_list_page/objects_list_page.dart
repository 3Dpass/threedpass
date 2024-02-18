import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/explorer_page/presentation/objects_list_page/objects_list_appbar.dart';
import 'package:threedpass/features/explorer_page/presentation/objects_list_page/reload_objects_icon_button.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list.dart';

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
        children: [
          const SizedBoxH16(),
          UploadedObjectsList(
            showHeader: false,
            filter: (final object) => true,
          ),
          const SizedBoxH16(),
        ],
      ),
    );
  }
}
