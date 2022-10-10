part of '../transfer_page.dart';

// class _FeesText extends StatelessWidget {
//   const _FeesText({
//     final Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(final BuildContext context) {
//     return BlocBuilder<TransferInfoCubit, TransferInfo>(
//       builder: (final context, final state) => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('estimated_transfer_fee'.tr()),
//           state.fees != null
//               ? Text((state.fees?.partialFee).toString())
//               : SizedBox(
//                   height: 15,
//                   width: 15,
//                   child: PlatformCircularProgressIndicator(),
//                 ),
//         ],
//       ),
//     );
//   }
// }
