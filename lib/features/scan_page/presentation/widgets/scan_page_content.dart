import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/no_saved_objects_placeholder.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list_header.dart';

class ScanPageContent extends StatelessWidget {
  const ScanPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HashesListBloc, HashesListState>(
      builder: (context, state) {
        if (state is HashesListLoaded) {
          if (state.objects.isEmpty) {
            return const NoSavedObjectsPlaceholder();
          } else {
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
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
