import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

@RoutePage()
class D3PRPCPage extends StatelessWidget {
  const D3PRPCPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<PreviewPageCubit>(context).state;
    final realPath = state.snapshot.realPath;
    final ex = realPath.split('.').last;
    // final file = File(realPath);

    return D3pScaffold(
      body: Column(
        children: [
          Text('Upload FILE.obj to 3drpc'),
          Text('Choose Account'),
          Text('Choose nApprovals'),
          Text('Choose Hashes'),
        ],
      ),
      appbarTitle: 'upload_to_3d_rpc_title',
    );
  }
}
