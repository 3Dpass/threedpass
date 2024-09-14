import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO DELETE THIS
@Deprecated(
  'Never use this. Try AutoRouter.of(context).popUntilRoot(); instead',
)
class OuterContextCubit extends Cubit<BuildContext> {
  OuterContextCubit(final BuildContext context) : super(context);
}
