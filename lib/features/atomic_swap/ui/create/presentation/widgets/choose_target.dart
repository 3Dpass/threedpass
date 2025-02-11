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
        Text('Target account'),
        H4(),
        D3pTextFormField(
          controller: textController,
          suffixButton: Icons.person,
          onSuffixButtonPressed: () => openContactsPicker(
              context: context,
              textFieldKey: textFieldKey,
              onPicked: (final contact) =>
                  textController.text = contact.address),
          key: textFieldKey,
        ),
      ],
    );
  }
}
