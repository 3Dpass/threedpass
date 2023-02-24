part of '../pages/compare_page.dart';

class CompareRow extends StatelessWidget {
  const CompareRow({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Flexible(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: _OrigObjectTitle(),
          ),
        ),
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: D3pBodyLargeText(
              'VS',
              textAlign: TextAlign.center,
              // style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: ChooseList(),
          ),
        ),
      ],
    );
  }
}
