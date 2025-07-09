import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/buttons/d3p_datetime_picker.dart';
import 'package:threedpass/core/widgets/input/d3p_switch_form_field.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/layout/separated_column.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/ui/poscan_asset_swap_action_input.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/bloc/create_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/entities/create_atomic_swap_state.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/presentation/widgets/choose_account_create_atomic_swap.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_with_error.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/utils/open_contacts_picker.dart';

part 'widgets/choose_deadline.dart';
part 'widgets/choose_target.dart';
part 'widgets/input_secret.dart';
part 'widgets/create_swap_submit_button.dart';
part 'widgets/warning_checkbox.dart';

class CreateSwapPage extends StatelessWidget {
  const CreateSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final bloc = BlocProvider.of<CreateAtomicSwapCubit>(context);
    return SomeForm(
      formKey: bloc.formKey,
      appbarTitle: 'poscan_atomic_swap_page_title',
      children: [
        ChooseAccountCreateAtomicSwap(),
        _ChooseTarget(),
        _InputSecret(),
        BlocBuilder<CreateAtomicSwapCubit, CreateAtomicSwapState>(
          builder: (BuildContext context, CreateAtomicSwapState state) =>
              PoscanAssetSwapActionInput(
            controller: bloc.assetAmountController,
            onSelected: (e) => bloc.selectAsset(e.assetId!),
            chosenItem: state.assetId != null
                ? PoolAssetField(isNative: false, assetId: state.assetId!)
                : null,
          ), // TODO Make action input choose only assetIds without native token,
        ),
        _ChooseDeadline(),
        _WarningCheckbox(),
      ],
      submitButton: const Padding16(
        child: _CreateSwapSubmitButton(),
      ),
      horizontalPadding: 16,
    );
  }
}
