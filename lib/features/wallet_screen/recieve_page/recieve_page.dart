import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

part './widgets/copy_button.dart';
part './widgets/qr_code.dart';

@RoutePage()
class RecievePage extends StatelessWidget {
  const RecievePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final accountData =
        BlocProvider.of<AppServiceLoaderCubit>(context).state.keyring.current;
    final address = accountData.address!;
    return D3pScaffold(
      appBarTitle: 'recieve_page_title',
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          _QRCode(address),
          const SizedBox(height: 24),
          Padding16(
            child: D3pBodyMediumText(
              address,
              translate: false,
            ),
          ),
          const SizedBox(height: 16),
          _CopyButton(address),
        ],
      ),
    );
  }
}
