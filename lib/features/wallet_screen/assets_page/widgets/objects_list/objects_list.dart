import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_empty_refresh_widget.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_header_full.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_pure.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class AssetsUploadedObjectsList extends StatefulWidget {
  const AssetsUploadedObjectsList({
    required this.appService,
    super.key,
  });

  final AppService appService;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AssetsUploadedObjectsList> {
  @override
  void initState() {
    super.initState();
    final objectsCubit = BlocProvider.of<PoscanObjectsCubit>(context);
    objectsCubit.stream.listen((final _) {
      if (!objectsCubit.state.areOwnerObjectsLoading) {
        loadUserObjects();
      }
    });
    loadUserObjects();
  }

  List<UploadedObject>? relatedObjects;

  Future<void> loadUserObjects() async {
    final uploadedObjectsCubit = BlocProvider.of<PoscanObjectsCubit>(context);
    final userObjects = await uploadedObjectsCubit
        .getUserObjects(widget.appService.keyring.current.address!);

    setState(() {
      relatedObjects = userObjects;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
      buildWhen: (final previous, final current) =>
          previous.areOwnerObjectsLoading != current.areOwnerObjectsLoading,
      builder: (final context, final state) =>
          BlocBuilder<NotificationsBloc, NotificationsState>(
        buildWhen: (final previous, final current) =>
            hasPutObj(previous) != hasPutObj(current),
        builder: (final context, final notifState) {
          if ((relatedObjects?.isEmpty ?? false) && hasPutObj(notifState)) {
            return const ObjectsListEmptyRefresh();
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding16(
                child: ObjectsListHeaderFull(),
              ),
              const SizedBoxH8(),
              Flexible(
                child: _ActualObjectsListSection(
                  isLoading: state.areOwnerObjectsLoading,
                  objects: relatedObjects,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static bool hasPutObj(final NotificationsState state) {
    final types = state.notifications.map((final e) => e.type).toList();
    return types.contains(NotificationType.putObject);
  }
}

class _ActualObjectsListSection extends StatelessWidget {
  final bool isLoading;
  final List<UploadedObject>? objects;

  const _ActualObjectsListSection({
    required this.isLoading,
    required this.objects,
  });

  @override
  Widget build(final BuildContext context) {
    if (isLoading) {
      return const D3pProgressIndicator(size: 24);
    }
    if (objects == null || objects!.isEmpty) {
      return const D3pBodyMediumText('no_owned_objects_found');
    } else {
      return ObjectsListPure(
        objects: objects!,
      );
    }
  }
}
