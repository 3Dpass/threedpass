// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
// import 'package:threedpass/features/wallet_screen/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
// import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
// import 'package:threedpass/router/router.gr.dart';

// class AssetTransferButton extends StatelessWidget {
//   const AssetTransferButton({final Key? key}) : super(key: key);

//   void onPressed(final BuildContext context) {
//     final tkd =
//         BlocProvider.of<AssetsGetExtrinsicsCubit>(context).tokenBalanceData;

//     context.router.push(
//       TransferRouteWrapper(
//         metadata: AssetTransferMetaDTO(
//           tokenBalanceData: tkd,
//           name: tkd.name ?? '',
//           decimals: tkd.decimals ?? 0,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(final BuildContext context) {
//     return D3pElevatedButton(
//       text: 'nnt_transfer_button_label'.tr(),
//       onPressed: () => onPressed(context),
//     );
//   }
// }
