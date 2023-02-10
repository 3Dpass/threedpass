import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/bloc/transfers_from_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/bloc/transfers_to_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/presentation/transactions_history_page.dart';
import 'package:threedpass/setup.dart';

class TransactionsHistoryWrapper extends StatelessWidget {
  const TransactionsHistoryWrapper({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransfersToCubit>(
          create: (final _) => getIt<TransfersToCubit>(),
        ),
        BlocProvider<TransfersFromCubit>(
          create: (final _) => getIt<TransfersFromCubit>(),
        ),
      ],
      child: const TransactionsHistoryPage(),
    );
    // return TransactionsHistoryPage();
  }
}
