import 'package:easy_localization/easy_localization.dart';
import 'package:threedpass/core/widgets/appbars/title_n_button_appbar.dart';
import 'package:threedpass/features/explorer_page/presentation/objects_list_page/reload_objects_icon_button.dart';

class ObjectsListAppbar extends TitleNButtonAppBar {
  ObjectsListAppbar({
    required final int objectsCount,
    super.key,
  }) : super(
          translateAppbar: false,
          titleText: objectsCount == 0
              ? 'No info about storage...'
              : 'objects_list_appbar_title'.tr(
                  args: [
                    'objects_plural'.plural(objectsCount),
                  ],
                ),
          // leading: null,
          trailingAction: const ReloadObjectsIconButton(),
        );
}
