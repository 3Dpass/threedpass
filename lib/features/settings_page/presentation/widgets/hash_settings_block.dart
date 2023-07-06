part of '../settings_page.dart';

class _HashSettingsBlock extends StatelessWidget {
  const _HashSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: const [
        _ScanSettingsTitle(),
        SizedBoxH8(),
        AlgorithmButton(),
        GridSizeButton(),
        SizedBoxH8(),
        _SectionsTextField(),
        SizedBoxH8(),
        _TransBytesInputField(),
        SizedBoxH36(),
      ],
    );
  }
}
