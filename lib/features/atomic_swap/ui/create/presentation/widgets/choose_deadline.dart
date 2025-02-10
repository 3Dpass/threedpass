part of '../create_swap_page.dart';

class _ChooseDeadline extends StatelessWidget {
  const _ChooseDeadline();

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Text('create_atomic_swap_choose_deadline_title'.tr()),
        Flexible(
          child: D3pDatetimePicker(
            validator: (p0) =>
                p0 != null ? null : 'no_date_chosen_validator'.tr(),
            onDone:
                BlocProvider.of<CreateAtomicSwapCubit>(context).updateDeadline,
          ),
        ),
      ],
    );
  }
}
