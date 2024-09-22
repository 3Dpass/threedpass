import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/bloc/swap_cubit.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_with_error.dart';

class SwapSubmit extends StatelessWidget {
  const SwapSubmit({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SwapCubit, SwapState>(
      builder: (final BuildContext context, final SwapState state) {
        // print(
        //     'COND ${state.isLoading} || ${state.errorUnlocalized.isNotEmpty}');
        return SomeFormSubmitWithErrorButton(
          extrinsicMixin: BlocProvider.of<SwapCubit>(context),
          isActive: !(state.isLoading || state.errorUnlocalized.isNotEmpty),
          unlocalizedError: state.errorUnlocalized,
        );
      },
    );
  }
}
