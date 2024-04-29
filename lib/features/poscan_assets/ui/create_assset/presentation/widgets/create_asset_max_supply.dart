import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';

class CreateAssetMaxSupply extends StatelessWidget {
  const CreateAssetMaxSupply({super.key});

  static String? onlyBigIntLimited(final String? p0, final BigInt? maxValue) {
    if (maxValue == null) {
      return 'create_asset_max_supply_property_not_chosen_error'.tr();
    }

    final res = BigInt.tryParse(p0 ?? '');

    if (res == null || res <= BigInt.zero) {
      return 'error_wrong_amount_int'.tr();
    }

    if (res > maxValue) {
      return 'max_supply_too_big_error'.tr();
    }

    return null;
  }

  @override
  Widget build(final BuildContext context) {
    final cpac = BlocProvider.of<CreatePoscanAssetCubit>(context);
    return BlocBuilder<CreatePoscanAssetCubit, CreatePoscanAssetState>(
      buildWhen: (final previous, final current) =>
          previous.propValue != current.propValue,
      builder: (final context, final state) => D3pTextFormField(
        labelText: 'create_account_label_max_supply'.tr(),
        validator: (final p0) =>
            onlyBigIntLimited(p0, state.propValue?.maxValue),
        controller: cpac.maxSupply,
      ),
    );
  }
}
