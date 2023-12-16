// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
// import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
// import 'package:threedpass/core/theme/d3p_special_styles.dart';
// import 'package:threedpass/core/widgets/buttons/enum_button.dart';
// import 'package:threedpass/core/widgets/other/padding_16.dart';
// import 'package:threedpass/core/widgets/paddings.dart';
// import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
// import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
// import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
// import 'package:threedpass/features/poscan_putobject/presentation/d3prpc_widgets/open_bottom_sheet.dart';
// import 'package:threedpass/features/poscan_putobject/utils/capitalize_first.dart';

// class ChooseAccountBottomSheet extends StatelessWidget {
//   const ChooseAccountBottomSheet({super.key});

//   @override
//   Widget build(final BuildContext context) {
//     final textStyles = Theme.of(context).customTextStyles;

//     final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
//     final accounts = appService.keyring.allAccounts;

//     return OpenBottomSheet(
//       unlocalizedSubtitle: 'poscan_putobject_choose_account',
//       buttonIconData: Icons.person,
//       buttonTextChild: BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
//         buildWhen: (final previous, final current) =>
//             previous.account != current.account,
//         builder: (final context, final state) => AccountChooseTileText(
//           name: state.account.name,
//           address: state.account.address,
//         ),
//       ),
//       bottomSheetPlatform: BlocBuilder<PoscanPutObjectCubit, D3PRPCCubitState>(
//         buildWhen: (final previous, final current) =>
//             previous.chosenCategory != current.chosenCategory,
//         builder: (final context, final state) => ListView.builder(
//           shrinkWrap: true,
//           itemCount: accounts.length,
//           itemBuilder: (final context, final index) => AccountChooseTileText(
//             name: accounts[index].name,
//             address: accounts[index].address,
//           ),
//         ),
//       ),
//     );
//   }
// }
