import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/app_text_styles.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/home_page/presentation/widgets/object_list/hash_card.dart';

class ObjectsList extends StatelessWidget {
  const ObjectsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HashesListBloc, HashesListState>(
      builder: (context, state) {
        if (state is HashesListLoaded) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.objects.length,
              itemBuilder: (context, objIndex) {
                final currentObject = state.objects[objIndex];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      child: Text(
                        currentObject.name,
                        style: AppTextStyles.subtitle,
                      ),
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 8,
                        left: 16,
                        right: 16,
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: currentObject.snapshots.length,
                      itemBuilder: (context, hashIndex) => HashCard(
                        snapshot: currentObject.snapshots[hashIndex],
                        hashObject: currentObject,
                      ),
                    ),
                  ],
                );
              });
        }
        return const SizedBox();
      },
    );
  }
}
