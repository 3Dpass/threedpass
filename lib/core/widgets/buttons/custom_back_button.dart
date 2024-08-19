import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  void outerPop(final BuildContext context) {
    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;
    Navigator.pop(outerContext);
  }

  Future<bool> usualPop(final BuildContext context) async {
    return context.router.maybePop();
  }

  @override
  Widget build(final BuildContext context) {
    final needSpecialPop = !context.router.canNavigateBack;

    return BackButton(
      onPressed:
          needSpecialPop ? () => outerPop(context) : () => usualPop(context),
    );
  }
}
