part of '../create_swap_page.dart';

class _ChooseDeadline extends StatelessWidget {
  const _ChooseDeadline();

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Text('create_atomic_swap_choose_deadline_title'.tr()),
        W16(),
        Flexible(
          child: D3pDatetimePicker(
            onDone:
                BlocProvider.of<CreateAtomicSwapCubit>(context).updateDeadline,
          ),
        ),
      ],
    );
  }
}
