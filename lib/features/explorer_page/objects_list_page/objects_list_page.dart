import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/explorer_page/objects_list_page/presentation/objects_list_appbar.dart';
import 'package:threedpass/features/explorer_page/objects_list_page/presentation/reload_objects_icon_button.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/objects_list/objects_list_item.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/presentation/widgets/first_page_exception_indicator.dart';

@RoutePage()
class ObjectsListPage extends StatelessWidget {
  const ObjectsListPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final controller =
        BlocProvider.of<PoscanObjectsCubit>(context).pagingController;
    return D3pScaffold(
      body: BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
        builder: (final context, final state) => state.isLoading
            ? const Center(child: D3pProgressIndicator(size: 24))
            : PagedListView<int, UploadedObject>.separated(
                pagingController: controller,
                builderDelegate: PagedChildBuilderDelegate<UploadedObject>(
                  itemBuilder: (final context, final item, final index) =>
                      ObjectsListItem(uploadedObject: item),
                  firstPageErrorIndicatorBuilder: (final context) =>
                      FirstPageExceptionIndicator(
                    onTryAgain: () =>
                        BlocProvider.of<PoscanObjectsCubit>(context).refresh(),
                    message: controller.error?.toString(),
                  ),
                ),
                separatorBuilder: (final context, final index) => const H8(),
                padding: const EdgeInsets.all(16),
              ),
        buildWhen: (final previous, final current) =>
            previous.isLoading != current.isLoading,
      ),
      appBarWidget: const ObjectsListAppbar(),
      appBarActions: [const ReloadObjectsIconButton()],
    );
  }
}
