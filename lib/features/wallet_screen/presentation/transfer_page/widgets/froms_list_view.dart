import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/from_card_many_to_one.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/from_card_one_to_many.dart';

/// List of cards send FROM
class FromsListView extends StatelessWidget {
  const FromsListView({
    required this.transferInfo,
    required this.metaInfoType,
    super.key,
  });

  final TransferInfo transferInfo;
  final MetaInfoType metaInfoType;

  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transferInfo.fromAddresses.length,
      itemBuilder: (final context, final index) =>
          transferInfo.screenType == TransferScreenType.many_to_one
              ? FromCardManyToOne(
                  data: transferInfo.fromAddresses[index],
                  sendAmountData: transferInfo.amounts[index],
                  metaInfoType: metaInfoType,
                )
              : FromCardOneToMany(
                  data: transferInfo.fromAddresses[index],
                ),
    );
  }
}
