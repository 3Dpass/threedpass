import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/theme/d3p_bottom_sheet_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview_page/bloc/d3prpc_cubit.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_password_text_field.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/password_textfield.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class D3PRPCPage extends StatelessWidget {
  const D3PRPCPage({super.key});

  Future<dynamic> openDialog(final BuildContext context) {
    // Hashes from all snapshots of the same file
    final sameFileHashes = <String>{};

    final state = BlocProvider.of<PreviewPageCubit>(context).state;
    final currentFileHash = state.snapshot.fileHash;
    final currentObject = state.hashObject;

    if (currentObject != null) {
      final snapshotsSameFileHash = <Snapshot>[];

      // Filter snapshots withe same file hash
      for (final snapshot in currentObject.snapshots) {
        if (snapshot.fileHash == currentFileHash) {
          snapshotsSameFileHash.add(snapshot);
        }
      }

      // Get hashes from same file snapshots
      for (final rightSnapshot in snapshotsSameFileHash) {
        for (final hash in rightSnapshot.hashes) {
          sameFileHashes.add(hash);
        }
      }
    }
    // Anuway add current hashes
    state.snapshot.hashes.forEach((final element) {
      sameFileHashes.add(element);
    });

    // final chosenFromAddresses =
    //     BlocProvider.of<TransferInfoBloc>(context).state.fromAddresses;

    // final accounts = AccountsList(
    //   allAccounts: allAccounts,
    //   chosenAccounts: chosenFromAddresses,
    // ).buildListToChoose();

    return showPlatformModalSheet<dynamic>(
      context: context,
      material: D3pBottonSheetTheme.materialTheme,
      builder: (final _) => Column(
        children: [
          const SizedBoxH24(),
          Flexible(
            child: BlocBuilder<D3PRPCCubit, D3PRPCCubitState>(
              builder: (final context, final state) => ListView.builder(
                shrinkWrap: true,
                itemCount: sameFileHashes.length,
                itemBuilder: (final context, final index) {
                  final hash = sameFileHashes.elementAt(index);
                  return EnumButton(
                    text: hash,
                    isChosen: state.chosenHashes.contains(hash),
                    onPressed: () =>
                        BlocProvider.of<D3PRPCCubit>(context).toggleHash(hash),
                    // child: Text(hash),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<D3PRPCCubit>(context);

    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final accounts = appService.keyring.allAccounts;

    final textStyle = Theme.of(context).customTextStyles;
    final colors = Theme.of(context).customColors;
    // final state =.state;
    return D3pScaffold(
      appbarTitle: 'upload_to_3d_rpc_title',
      body: SingleChildScrollView(
        child: Padding16(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxH16(),

              D3pBodyLargeText(
                'chosen_file_to_upload_to_3drpc'
                    .tr(args: [cubit.fileHash.toString()]),
                translate: false,
              ),
              SizedBoxH16(),
              Text('Choose Account'),
              SizedBoxH4(),
              D3pDropdownButton<KeyPairData>(
                context: context,
                isExpanded: true,
                items: accounts
                    .map<DropdownMenuItem<KeyPairData>>(
                      (final e) => DropdownMenuItem(
                        value: e,
                        child: AccountChooseTileText(
                          name: e.name,
                          address: e.address,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (final obj) {},
                value: accounts.first,
              ),
              SizedBoxH4(),
              // Text('Account password'),
              // SizedBoxH4(),
              BasicPasswordTextField(
                passwordController: cubit.accountPassword,
              ),
              // D3pTextFormField(
              //   labelText: 'enter_password_label'.tr(),
              //   controller: cubit.accountPassword,
              //   hintText: 'enter_password_hint'.tr(),
              // ),
              SizedBoxH16(),
              Text('Choose nApprovals'),
              SizedBoxH4(),
              D3pTextFormField(
                controller: cubit.nApprovalsController,
                hintText: 'n_approvals_hint'.tr(),
                validator: (p0) {
                  final res = int.tryParse(p0 ?? '');

                  return res != null && res! > 0
                      ? null
                      : 'error_wrong_amount_int'.tr();
                },
                keyboardType: TextInputType.number,
              ),
              SizedBoxH16(),
              Text('Choose Hashes (optional)'),
              SizedBoxH4(),
              D3pElevatedButton(
                text: null,
                onPressed: () => openDialog(context),
                backgroundColor: colors.defaultInputColor,
                elevation: 0,
                childAlignment: MainAxisAlignment.start,
                textStyle: textStyle.d3pBodyMedium,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<D3PRPCCubit, D3PRPCCubitState>(
                      builder: (final context, final state) => Text(
                        'x_hashes_chosen'.tr(
                          args: [
                            'HASHES_number_plural'.plural(
                              state.chosenHashes.length,
                            ),
                          ],
                        ),
                        style: textStyle.d3pBodyMedium,
                      ),
                    ),
                    Icon(
                      Icons.list,
                      color: colors.themeOpposite,
                    ),
                  ],
                ),
              ),
              SizedBoxH24(),
              Text(
                'This transaction takes fees',
                style: textStyle.secondaryText,
              ),
              SizedBox(
                height: 2,
              ),
              D3pElevatedButton(
                text: 'Submit',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
