import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/utils/empty_function.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/other/choose_account/bloc/choose_account_cubit.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_password_text_field.dart';

part 'choose_account_internal.dart';

class ChooseAccount extends StatelessWidget {
  const ChooseAccount({
    required this.onAccountSelected,
    required this.passwordController,
    this.title,
    super.key,
  });

  final void Function(KeyPairData) onAccountSelected;
  final TextEditingController passwordController;
  final String? title;

  @override
  Widget build(final BuildContext context) {
    final appServiceCubit = BlocProvider.of<AppServiceLoaderCubit>(context);

    return BlocProvider(
      create: (final _) => ChooseAccountCubit(
        appServiceLoaderCubit: appServiceCubit,
        onAccountSelected: onAccountSelected,
        passwordController: passwordController,
      ),
      child: _ChooseAccountInternal(
        title: title,
      ),
    );
  }
}
