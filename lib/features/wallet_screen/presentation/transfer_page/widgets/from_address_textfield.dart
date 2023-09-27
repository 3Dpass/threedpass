import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class FromAddressTextField extends StatelessWidget {
  const FromAddressTextField({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final theme = Theme.of(context);
    // Colors from https://github.com/flutter/flutter/blob/936763f58963ef3dd103986fc232310c43360344/packages/flutter/lib/src/material/input_decorator.dart#L4561

    // switch (Theme.of(context).brightness) {
    //     case Brightness.dark:
    //       return const Color(0x0DFFFFFF);
    //     case Brightness.light:
    //       return const Color(0x05000000) ;
    //   }
    final textStyle = Theme.of(context).customTextStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'from_address_label'.tr(),
          style: textStyle.d3pBodySmall.copyWith(color: D3pColors.disabled),
        ),
        const SizedBoxH4(),
        SizedBox(
          height: 43,
          child: D3pElevatedButton(
            text: null,
            onPressed: () => openDialog(context),
            backgroundColor: const Color(0x0DFFFFFF),
            elevation: 0,
            childAlignment: MainAxisAlignment.start,
            textStyle: textStyle.d3pBodyMedium,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Account name'),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ),
      ],
    );

    // return BasicTransferTextField(
    //   enabled: false,
    //   labelText: 'from_address_label'.tr(),
    //   controller: TextEditingController(
    //     text: Fmt.shorterAddress(
    //       appService.keyring.current.address,
    //     ),
    //   ),
    // );
  }

  Future<dynamic> openDialog(final BuildContext context) {
    final accounts = BlocProvider.of<AppServiceLoaderCubit>(context)
        .state
        .keyring
        .allAccounts;

    //BlocProvider.of<AppServiceLoaderCubit>(context).state.plugin.sdk.api.account.queryBalance

    // Fmt.shorterAddress(
    //       appService.keyring.current.address,
    //     ),
    return showPlatformModalSheet<dynamic>(
      context: context,
      material: MaterialModalSheetData(
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      builder: (final _) => Column(
        children: [
          const SizedBoxH24(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: accounts.length,
            itemBuilder: (final context, final index) => EnumButton(
              text: null,
              isChosen: false,
              onPressed: () {},
              child: _AccountChooseTileText(
                address: accounts[index].address,
                name: accounts[index].name,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountChooseTileText extends StatelessWidget {
  const _AccountChooseTileText({
    required this.address,
    required this.name,
  });

  final String? name;
  final String? address;

  String fixedName() {
    if (name != null) {
      return name! + '   ';
    } else {
      return '';
    }
  }

  String shortAddress() {
    return Fmt.shorterAddress(address);
  }

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;
    return Text.rich(
      TextSpan(
        text: fixedName(),
        children: [
          TextSpan(
            text: shortAddress(),
            style: textStyles.d3pBodyMedium.copyWith(color: D3pColors.disabled),
          ),
        ],
      ),
    );
    // return '${fixedName()}${shortAddress()}';
  }
}
