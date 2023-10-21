import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';

class DismissFunctionFabric {
  final BuildContext context;

  const DismissFunctionFabric(this.context);

  void Function() buildToAddress(final ToAddressData data) {
    final transferInfoCubit = BlocProvider.of<TransferInfoCubit>(context);
    return () => transferInfoCubit.removeToAddress(data);
  }

  void Function() buildFromAddress(final FromAddressData data) {
    final transferInfoCubit = BlocProvider.of<TransferInfoCubit>(context);
    return () => transferInfoCubit.removeFromAddress(data);
  }
}
