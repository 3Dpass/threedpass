import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/from_card_many_to_one.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/from_card_one_to_many.dart';

/// List of cards send FROM
class FromsListView extends StatelessWidget {
  const FromsListView({
    required this.transferInfo,
    required this.metaInfoType,
    super.key,
  });

  final TransferInfoBlocState transferInfo;
  final MetaInfoType metaInfoType;

  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (final context, final index) =>
          transferInfo.screenType == TransferScreenType.many_to_one
              ? FromCardManyToOne(
                  data: transferInfo.fromAddresses[index],
                  sendAmountData: transferInfo.amounts[index],
                  metaInfoType: metaInfoType,
                  isFirst: index == 0,
                )
              : FromCardOneToMany(
                  data: transferInfo.fromAddresses[index],
                  isFirst: index == 0,
                ),
      itemCount: transferInfo.fromAddresses.length,
    );
  }
}
