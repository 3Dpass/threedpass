import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/non_native_token_create.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/block_datetime_w.dart';

class NonNativeTokenCreateWidget extends StatelessWidget {
  final NonNativeTokenCreate data;

  const NonNativeTokenCreateWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetExtrinsicsCubit>(context)
        .getExtrinsics
        .params
        .tokenBalanceData;
    return Column(
      children: [
        BlockDateTimeW(
          data.blockDatetime,
        ),
      ],
    );
  }
}
