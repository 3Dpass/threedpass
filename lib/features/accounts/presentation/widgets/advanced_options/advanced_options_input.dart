import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:threedpass/features/accounts/bloc/advanced_options_from_bloc.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';

class AdvancedOptionsInput extends StatelessWidget {
  const AdvancedOptionsInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build3');
    final formBloc = context.read<AdvancedOptionsFromBloc>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
          ),
          header: Text('advanced_options_header'.tr()),
          collapsed: const SizedBox(),
          expanded: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownFieldBlocBuilder<CryptoType>(
                selectFieldBloc: formBloc.cryptoType,
                decoration: InputDecoration(
                  labelText: 'encrypt_type_picker_label'.tr(),
                ),
                itemBuilder: (context, value) => FieldItem(
                  child: Text(value.name),
                ),
                onChanged: (value) {
                  value != null ? formBloc.emitSubmitting() : null;
                  formBloc.state
                      .textFieldBlocOf(AdvancedOptionsFromBloc.derivePathName)
                      ?.validate();
                },
              ),
              const SizedBox(height: 8),
              TextFieldBlocBuilder(
                textFieldBloc: formBloc.derivePath,
                decoration: InputDecoration(
                  hintText: '//hard/soft///password',
                  labelText: 'derivation_path_input_label'.tr(),
                ),
              ),
              const SizedBox(height: 8),
              StreamBuilder<FormBlocState<AccountAdvancedOptions, String>>(
                stream: formBloc.stream,
                // initialData: ,
                builder: (context, state) {
                  print(
                    'RebuildStreamable ${state.data?.runtimeType.toString()}',
                  );
                  return SizedBox();
                },
              ),
              // BlocBuilder<AdvancedOptionsFromBloc,
              //         FormBloc<AccountAdvancedOptions, String>>(
              //     builder: (context, state) => SizedBox()),
              // TextButton(
              //   onPressed: () => formBloc.submit(),
              //   child: Text('apply_options_button'.tr()),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
