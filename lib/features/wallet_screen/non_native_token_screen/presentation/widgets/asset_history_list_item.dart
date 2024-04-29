// part of '../non_native_token_screen.dart';

// class AssetHistoryListItem extends StatelessWidget {
//   final NonNativeTokenHistoryAtomBase data;

//   const AssetHistoryListItem(this.data, {super.key});

//   @override
//   Widget build(final BuildContext context) {
//     switch (data.extrinsicType) {
//       case NonNativeTokenExtrinsicType.create:
//         return AssetHistoryCreateWidget(data as AssetHistoryCreate);

//       case NonNativeTokenExtrinsicType.set_metadata:
//         return AssetHistorySetMetadataWidget(
//           data as AssetHistorySetMetadata,
//         );

//       case NonNativeTokenExtrinsicType.mint:
//         return AssetHistoryMintWidget(data as AssetHistoryMint);

//       case NonNativeTokenExtrinsicType.transfer:
//         return TransactionItem(
//           object: (data as AssetHistoryTransfer).transferHistoryUI(),
//         );
//       case NonNativeTokenExtrinsicType.unknown:
//         return AssetHistoryUnknownWidget(data as AssetHistoryUnkown);
//     }
//   }
// }
