import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/accounts/bloc/address_icon_data_preview_cubit.dart';

class AddressIconPreviewCubitProvider extends StatelessWidget {
  const AddressIconPreviewCubitProvider({
    required this.child,
    final Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<AddressIconDataPreviewCubit>(
      create: (final context) => AddressIconDataPreviewCubit(
        BlocProvider.of<AppServiceLoaderCubit>(context),
      ),
      child: Builder(
        builder: (final context) => child,
      ),
    );
  }
}
