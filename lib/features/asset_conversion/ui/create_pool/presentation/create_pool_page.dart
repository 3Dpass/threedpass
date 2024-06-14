import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';

@RoutePage()
class CreatePoolPage extends StatelessWidget {
  const CreatePoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return D3pScaffold(
      appbarTitle: 'Create pool',
      body: SizedBox(),
    );
  }
}
