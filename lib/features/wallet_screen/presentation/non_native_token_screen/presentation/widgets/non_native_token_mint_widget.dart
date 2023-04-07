import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/non_native_token_mint.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/block_datetime_w.dart';

class NonNativeTokenMintWidget extends StatelessWidget {
  final NonNativeTokenMint data;

  const NonNativeTokenMintWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
        .getExtrinsics
        .params
        .tokenBalanceData;
    return Column(
      children: [
        Text('MINT TOKEN'),
        BlockDateTimeW(
          data.blockDatetime,
        ),
      ],
    );
  }
}
