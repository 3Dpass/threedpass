part of '../create_swap_page.dart';

class _ChooseDeadline extends StatelessWidget {
  const _ChooseDeadline();

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('create_atomic_swap_choose_deadline_title'.tr()),
        H4(),
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
