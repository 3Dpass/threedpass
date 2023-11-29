import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/d3prpc_widgets/choose_account.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/d3prpc_widgets/choose_approvals.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/d3prpc_widgets/choose_file.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/d3prpc_widgets/choose_hashes.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/d3prpc_widgets/choose_properties.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/d3prpc_widgets/d3prpc_submit_button.dart';

@RoutePage()
class D3PRPCPage extends StatelessWidget {
  const D3PRPCPage({super.key});

  @override
  Widget build(final BuildContext context) {
    // final cubit = BlocProvider.of<D3PRPCCubit>(context);

    // final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    // // final accounts = appService.keyring.allAccounts;

    // final textStyle = Theme.of(context).customTextStyles;
    // final colors = Theme.of(context).customColors;
    // final state =.state;
    return const D3pScaffold(
      appbarTitle: 'upload_to_3d_rpc_title',
      body: SingleChildScrollView(
        child: Padding16(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChooseFile(),
              ChooseAccount(),
              ChooseApprovals(),
              ChooseHashes(),
              ChooseProperties(),
              D3pRPCSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
