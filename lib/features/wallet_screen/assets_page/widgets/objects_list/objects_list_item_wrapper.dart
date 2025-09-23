import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_item.dart';
import 'package:threedpass/setup.dart';

class ObjectsListItemWrapper extends StatefulWidget {
  final int id;

  const ObjectsListItemWrapper({
    required this.id,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ObjectsListItemWrapper> {
  UploadedObject? uploadedObject = null;

  @override
  void initState() {
    getIt<GetUploadedObject>().safeCall(
      params: widget.id,
      onError: (final e, final st) => Fluttertoast.showToast(
        msg: 'Failed to load object id: ${widget.id}. $e',
        toastLength: Toast.LENGTH_LONG,
      ),
      onSuccess: (final value) {
        if (mounted) setState(() => uploadedObject = value);
      },
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    if (uploadedObject != null) {
      return ObjectsListItem(uploadedObject: uploadedObject!);
    } else {
      return const D3pProgressIndicator(size: 32);
    }
  }
}
