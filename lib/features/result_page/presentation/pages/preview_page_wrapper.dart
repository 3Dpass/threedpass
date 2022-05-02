import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/result_page/presentation/bloc/preview_page_cubit.dart';

class PreviewPageWrapper extends StatelessWidget {
  const PreviewPageWrapper({
    Key? key,
    required this.hashObject,
    required this.snapshot,
    required this.isSaved,
  }) : super(key: key);

  final HashObject? hashObject;
  final Snapshot snapshot;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PreviewPageCubit>(
      create: (context) => PreviewPageCubit(
        PreviewPageCubitState(
          hashObject: hashObject,
          snapshot: snapshot,
          isSaved: isSaved,
        ),
      ),
      child: const AutoRouter(),
    );
  }
}
