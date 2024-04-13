import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/bloc/set_metadata_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/presentation/widget/set_metadata_choose_account.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/presentation/widget/set_metadata_choose_asset_id.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/presentation/widget/set_metadata_decimals_textfields.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/presentation/widget/set_metadata_name_textfield.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/presentation/widget/set_metadata_submit_button.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/presentation/widget/set_metadata_symbol_textfield.dart';

@RoutePage()
class SetMetadataPage extends StatelessWidget {
  const SetMetadataPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<SetMetadataAssetCubit>(context).formKey,
      appbarTitle: 'LOCALIZE_APPBAR',
      children: const [
        SetMetadataChooseAsset(),
        SetMetadataChooseAccount(),
        SetMetadataNameTextfield(),
        SetMetadataSymbolTextfield(),
        SetMetadataDecimalslTextfield(),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: SetMetadataSubmitButton(),
        ),
      ],
    );
  }
}
