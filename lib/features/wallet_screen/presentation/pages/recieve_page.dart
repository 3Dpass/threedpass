import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';

class RecievePage extends StatelessWidget {
  const RecievePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountData =
        BlocProvider.of<AppServiceLoaderCubit>(context).state.keyring.current;
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'recieve_page_title'.tr(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Container(
              height: MediaQuery.of(context).size.width - 16 * 2,
              alignment: Alignment.center,
              child: QrImage(
                padding: EdgeInsets.zero,
                data: accountData.address!,
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.width - 16 * 2,
              ),
            ),
            const SizedBox(height: 24),
            // Container(
            //   color: Colors.red,
            //   height: 100,
            //   width: 100,
            // ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              child: Text(
                accountData.address!,
                // style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const SizedBox(height: 16),
            D3pElevatedButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              text: 'Copy'.tr(),
              iconData: Icons.copy,
              minimumSize: const Size(120, 50),
              onPressed: () => copyAndNotify(textToCopy: accountData.address!),
            ),
          ],
        ),
      ),
    );
  }
}
