import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/addressIconData.dart';
import 'package:threedpass/core/polkawallet/widgets/address_icon.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/accounts/bloc/address_icon_data_preview_cubit.dart';

class AddressIconPreview extends StatelessWidget {
  final bool isRawseed;
  final Function(bool)? callBackAddressNull;

  const AddressIconPreview(
      {final Key? key, this.isRawseed = false, this.callBackAddressNull})
      : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 40,
      child: BlocBuilder<AddressIconDataPreviewCubit, AddressIconData?>(
        builder: (final context, final state) {
          if (state == null || state.address == null) {
            if (isRawseed) {
              callBackAddressNull!(false);
              return const Center(
                child: D3pBodyMediumText('import_rawseed_preview_placeholder'),
              );
            } else {
              return const Center(
                child: D3pBodyMediumText('import_mnemonic_preview_placeholder'),
              );
            }
          } else if (state.address != null && isRawseed) {
            callBackAddressNull!(true);
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                D3pAddressIcon(
                  state.svg,
                  size: 40,
                ),
                const SizedBox(width: 8),
                D3pBodyMediumText(
                  state.address!,
                  translate: false,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
