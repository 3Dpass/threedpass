import 'package:easy_localization/easy_localization.dart';
import 'package:hashlib/hashlib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/d3p_datetime_picker.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/atomic_swap/ui/create/bloc/create_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/ui/create/presentation/widgets/choose_account_create_atomic_swap.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_with_error.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/utils/open_contacts_picker.dart';

part 'widgets/choose_deadline.dart';
part 'widgets/choose_target.dart';
part 'widgets/input_secret.dart';
part './widgets/create_swap_submit_button.dart';

class CreateSwapPage extends StatelessWidget {
  const CreateSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<CreateAtomicSwapCubit>(context).formKey,
      appbarTitle: 'create_asset_page_title',
      children: [
        ChooseAccountCreateAtomicSwap(),
        _ChooseTarget(),
        _InputSecret(),
        _ChooseDeadline(),
      ],
      submitButton: const _CreateSwapSubmitButton(),
    );
  }
}
