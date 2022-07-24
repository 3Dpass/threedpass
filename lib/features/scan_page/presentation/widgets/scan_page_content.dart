import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list_header.dart';

class ScanPageContent extends StatelessWidget {
  const ScanPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HashesListBloc, HashesListState>(
      builder: (context, state) {
        if (state is HashesListLoaded && state.objects.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ObjectsListHeader(
                state: state,
              ),
              const SizedBox(height: 4),
              Flexible(
                child: ObjectsList(
                  state: state,
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'no_saved_objects_placeholder'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey),
              ),
            ),
          );
        }
      },
    );
  }
}
