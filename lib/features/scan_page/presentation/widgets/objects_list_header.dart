part of './scan_page_content.dart';

class _ObjectsListHeader extends StatelessWidget {
  const _ObjectsListHeader({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        'saved_objects_header'.tr(),
        style: Theme.of(context).customTextStyles.d3pheadlineMedium,
      ),
    );
  }
}
