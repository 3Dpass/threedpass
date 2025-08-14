part of '../create_swap_page.dart';

class _ChooseTarget extends StatelessWidget {
  _ChooseTarget();

  final GlobalKey textFieldKey = GlobalKey();

  @override
  Widget build(final BuildContext context) {
    final textController =
        BlocProvider.of<CreateAtomicSwapCubit>(context).toAccountController;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text('target_account'.tr()),
        D3pTextFormField(
          key: textFieldKey,
          controller: textController,
          hintText: 'Enter address', // TODO Localize
          suffixButton: Icons.person,
          onSuffixButtonPressed: () => openContactsPicker(
            context: context,
            textFieldKey: textFieldKey,
            onPicked: (final contact) => textController.text = contact.address,
          ),
          validator: Validators.notEmpty,
        ),
      ],
    );
  }
}
