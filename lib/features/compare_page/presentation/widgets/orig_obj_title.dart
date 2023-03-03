part of '../pages/compare_page.dart';

class _OrigObjectTitle extends StatelessWidget {
  const _OrigObjectTitle();

  @override
  Widget build(final BuildContext context) {
    final origSnap = context.read<CompareCubit>().origObj;
    return D3pBodyLargeText(
      origSnap.name.cutWithEllipsis(16),
      overflow: TextOverflow.ellipsis,
    );
  }
}
