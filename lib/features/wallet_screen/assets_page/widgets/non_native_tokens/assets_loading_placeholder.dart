part of './non_native_tokens.dart';

class _AssetsLoadingPlaceholder extends StatelessWidget {
  const _AssetsLoadingPlaceholder();

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        const SizedBoxH36(),
        PlatformCircularProgressIndicator(),
      ],
    );
  }
}
