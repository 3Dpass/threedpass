import 'package:threedpass/core/widgets/appbars/title_n_button_appbar.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/select_many_icon_button.dart';

class ScanAppBar extends TitleNButtonAppBar {
  ScanAppBar({super.key})
      : super(
          titleText: 'recognize_your_objects',
          trailingAction: const SelectManyIconButton(),
        );
}
