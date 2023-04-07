import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/non_native_token_unknown.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/block_datetime_w.dart';

class NonNativeTokenUnknownWidget extends StatelessWidget {
  final NonNativeTokenUnkown data;

  const NonNativeTokenUnknownWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
        .getExtrinsics
        .params
        .tokenBalanceData;
    return Column(
      children: [
        Text('Unknown TOKEN'),
        Text(data.callModule),
        Text(data.arguments),
        BlockDateTimeW(
          data.blockDatetime,
        ),
      ],
    );
  }
}
