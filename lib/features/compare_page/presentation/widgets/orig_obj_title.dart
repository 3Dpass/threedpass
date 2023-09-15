part of './compare_row.dart';

class _OrigObjectTitle extends StatelessWidget {
  const _OrigObjectTitle();

  @override
  Widget build(final BuildContext context) {
    final origSnap = context.read<CompareCubit>().origObj;
    return D3pBodyLargeText(
      origSnap.name.cutWithEllipsis(16),
      overflow: TextOverflow.ellipsis,
      translate: false,
    );
  }
}
