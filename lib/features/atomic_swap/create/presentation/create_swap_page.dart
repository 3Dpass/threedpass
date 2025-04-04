import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/buttons/d3p_datetime_picker.dart';
import 'package:threedpass/core/widgets/input/d3p_switch_form_field.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/layout/list_view_separated.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/atomic_swap/create/bloc/create_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/create/domain/entities/create_atomic_swap_state.dart';
import 'package:threedpass/features/atomic_swap/create/presentation/widgets/choose_account_create_atomic_swap.dart';
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
    return SomeForm(
      formKey: BlocProvider.of<CreateAtomicSwapCubit>(context).formKey,
      appbarTitle: 'poscan_atomic_swap_page_title',
      children: [
        Padding16(
          child: ListViewSeparated(
            children: [
              ChooseAccountCreateAtomicSwap(),
              _ChooseTarget(),
              _InputSecret(),
              _ChooseDeadline(),
            ],
            separator: const H16(),
          ),
        ),
        _WarningCheckbox(),
      ],
      submitButton: const Padding16(
        child: _CreateSwapSubmitButton(),
      ),
      horizontalPadding: 0,
    );
  }
}
