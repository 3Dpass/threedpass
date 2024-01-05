import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class RawUploadedObjectContent extends StatelessWidget {
  const RawUploadedObjectContent({required this.uploadedObject, super.key});

  final UploadedObject uploadedObject;

  @override
  Widget build(final BuildContext context) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final tmp = Map<dynamic, dynamic>.from(uploadedObject.raw);
    tmp['obj'] = tmp['obj'].toString().cutWithEllipsis(16);

    final String prettyprint = encoder.convert(tmp);

    return D3pBodyMediumText(
      prettyprint,
      translate: false,
      // ),
      // onTap: () => copyAndNotify(
      //   textToCopy: prettyprint,
      //   textToShow: 'Raw info copied',
      // ),
    );
  }
}
