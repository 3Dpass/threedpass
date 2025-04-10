import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/bloc/get_transfers_cubit.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/presentation/transactions_history_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class TransactionsHistoryPageWrapper extends StatelessWidget {
  const TransactionsHistoryPageWrapper({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetTransfersCubit>(
          create: (final _) => getIt<GetTransfersCubit>(),
        ),
      ],
      child: const TransactionsHistoryPage(),
    );
    // return TransactionsHistoryPage();
  }
}
