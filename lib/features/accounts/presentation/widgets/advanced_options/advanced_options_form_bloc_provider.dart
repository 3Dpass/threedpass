import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/bloc/advanced_options_from_bloc.dart';

class AdvancedOptionsFormBlocProvider extends StatelessWidget {
  const AdvancedOptionsFormBlocProvider({
    Key? key,
    required this.child,
    required this.appService,
    required this.mnemonic,
  }) : super(key: key);

  final String mnemonic;
  final AppService appService;

  final Widget child;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => AdvancedOptionsFromBloc(
          mnemonic: mnemonic,
          appService: appService,
        ),
        // get context with AdvancedOptionsFromBloc
        child: Builder(builder: (context) {
          final formBloc = context.read<AdvancedOptionsFromBloc>();
          return child;
        }),
      );
}
