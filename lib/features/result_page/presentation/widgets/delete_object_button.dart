import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';

class DeleteSnapshotButton extends StatelessWidget {
  const DeleteSnapshotButton({
    Key? key,
    required this.snapshot,
    required this.hashObject,
  }) : super(key: key);

  final Snapshot snapshot;
  final HashObject? hashObject;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.primaryButton,
      child: const Text('Remove & clear the cache'),
      onPressed: () {
        if (hashObject != null) {
          BlocProvider.of<HashesListBloc>(context).add(
            DeleteHash(
              hash: snapshot,
              object: hashObject!,
            ),
          );
        }
        Navigator.pop(context);
      },
    );
  }
}
