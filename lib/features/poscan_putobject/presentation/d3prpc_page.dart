import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_approvals.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_category.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_file.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_hashes.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/choose_properties.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/putobject_choose_account.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/putobject_submit_button.dart';

@RoutePage()
class D3PRPCPage extends StatelessWidget {
  const D3PRPCPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<PoscanPutObjectCubit>(context).formKey,
      appbarTitle: 'upload_to_3d_rpc_title',
      submitButton: const PutObjectSubmitButton(),
      children: const [
        ChooseFile(),
        PutObjectChooseAccount(),
        ChooseCategory(),
        ChooseApprovals(),
        ChooseHashes(),
        ChooseProperties(),
      ],
    );
  }
}
