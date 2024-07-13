import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';

class ReloadObjectsIconButton extends StatelessWidget {
  const ReloadObjectsIconButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pIconButton(
      iconData: Icons.refresh,
      onPressed: () => reloadCache(context),
    );
  }

  Future<void> reloadCache(final BuildContext context) async {
    final bloc = BlocProvider.of<PoscanObjectsCubit>(context);

    bloc.pagingController.refresh();
  }
}
