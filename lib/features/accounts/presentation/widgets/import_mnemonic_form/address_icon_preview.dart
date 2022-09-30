import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/addressIconData.dart';
import 'package:threedpass/core/polkawallet/widgets/address_icon.dart';
import 'package:threedpass/features/accounts/bloc/address_icon_data_preview_cubit.dart';

class AddressIconPreview extends StatelessWidget {
  const AddressIconPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: BlocBuilder<AddressIconDataPreviewCubit, AddressIconData?>(
        builder: (context, state) {
          if (state == null || state.address == null) {
            return Center(
              child: Text('import_mnemonic_preview_placeholder'.tr()),
            );
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddressIcon(
                  state.svg,
                  size: 40,
                ),
                // state.svg == null
                //     ? Image.asset(
                //         'assets/wallet/polkadot_avatar.png',
                //       )
                //     : SvgPicture.string(state.svg!),
                const SizedBox(width: 8),
                Text(state.address!),
              ],
            ),
          );
        },
      ),
    );
  }
}
