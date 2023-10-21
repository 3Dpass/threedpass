import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/to_card_many_to_one.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/to_card_one_to_many.dart';

/// List of cards send TO
class ToListView extends StatelessWidget {
  const ToListView({
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
      itemCount: transferInfo.toAddresses.length,
      itemBuilder: (final context, final index) =>
          transferInfo.screenType == TransferScreenType.many_to_one
              ? ToCardManyToOne(
                  data: transferInfo.toAddresses[index],
                  isFirst: index == 0,
                )
              : ToCardOneToMany(
                  data: transferInfo.toAddresses[index],
                  sendAmountData: transferInfo.amounts[index],
                  metaInfoType: metaInfoType,
                  isFirst: index == 0,
                ),
    );
  }
}
