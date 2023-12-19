import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/add_from_card_row.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/add_to_card_row.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/froms_list_view.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/tos_list_view.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/transfer_type_switch.dart';

class TransferPageAddressesList extends StatelessWidget {
  const TransferPageAddressesList({
    required this.state,
    super.key,
  });

  final TransferInfoBlocState state;

  @override
  Widget build(final BuildContext context) {
    final transferInfo = BlocProvider.of<TransferInfoBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxH8(),
        FromsListView(
          transferInfo: state,
          metaInfoType: transferInfo.metaDTO.type,
        ),
        const AddFromCardRow(),
        const _ArrowFromTo(),
        ToListView(
          transferInfo: state,
          metaInfoType: transferInfo.metaDTO.type,
        ),
        const AddToCardRow(),
        const TransferTypeSwitch(),
        const SizedBox(height: 72),
      ],
    );
  }
}

class _ArrowFromTo extends StatelessWidget {
  const _ArrowFromTo();

  @override
  Widget build(final BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.arrow_downward_outlined,
        size: 30,
      ),
    );
  }
}
