import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_item.dart';

class ObjectsListPure extends StatelessWidget {
  const ObjectsListPure({required this.objects, super.key});

  final List<UploadedObject> objects;

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      shrinkWrap: true,
      itemCount: objects.length,
      separatorBuilder: (final context, final index) => const H8(),
      itemBuilder: (final context, final index) => ObjectsListItem(
        uploadedObject: objects[index],
      ),
    );
  }
}
