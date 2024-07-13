import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/explorer_page/objects_list_page/presentation/objects_list_appbar.dart';
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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const ObjectsListAppbar(),
        cupertino: (final context, final platform) =>
            CupertinoNavigationBarData(padding: EdgeInsetsDirectional.zero),
        material: (final context, final platform) => MaterialAppBarData(
          titleSpacing: 0,
        ),
      ),
      body: BlocBuilder<PoscanObjectsCubit, PoscanObjectsState>(
        buildWhen: (final previous, final current) =>
            previous.isLoading != current.isLoading,
        builder: (final context, final state) => state.isLoading
            ? const Center(
                child: D3pProgressIndicator(),
              )
            : PagedListView<int, UploadedObject>.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                pagingController: controller,
                separatorBuilder: (final context, final index) =>
                    const SizedBoxH8(),
                builderDelegate: PagedChildBuilderDelegate<UploadedObject>(
                  itemBuilder: (final context, final item, final index) =>
                      ObjectsListItem(
                    uploadedObject: item,
                  ),
                  firstPageErrorIndicatorBuilder: (final context) =>
                      FirstPageExceptionIndicator(
                    onTryAgain: controller.refresh,
                    message: controller.error?.toString(),
                  ),
                ),
              ),
      ),
    );
  }
}
