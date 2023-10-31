import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_bloc.dart';

class DismissFunctionFabric {
  final BuildContext context;

  const DismissFunctionFabric(this.context);

  void Function() buildToAddress(final ToAddressData data) {
    final transferInfoCubit = BlocProvider.of<TransferInfoBloc>(context);
    return () => transferInfoCubit.add(RemoveToAddressEvent(data));
  }

  void Function() buildFromAddress(final FromAddressData data) {
    final transferInfoCubit = BlocProvider.of<TransferInfoBloc>(context);
    return () => transferInfoCubit.add(RemoveFromAddressEvent(data));
  }
}
