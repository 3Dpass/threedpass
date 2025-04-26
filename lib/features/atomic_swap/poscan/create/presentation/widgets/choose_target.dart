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
      children: [
        Text('target_account'.tr()),
        H4(),
        D3pTextFormField(
          key: textFieldKey,
          controller: textController,
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
