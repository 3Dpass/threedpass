import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/disable_refresh_button.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_cubit.dart';

class RefreshPendingSwapsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DisableRefreshButton(
      onPressed: () => BlocProvider.of<PendingAtomicSwapCubit>(context).init(),
    );
  }
}
