import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';

class DeleteObjectButton extends StatelessWidget {
  const DeleteObjectButton({
    Key? key,
    required this.hashesModel,
  }) : super(key: key);

  final Snapshot hashesModel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.primaryButton,
      child: const Text('Remove & clear the cache'),
      onPressed: () {
        BlocProvider.of<HashesListBloc>(context).add(
          DeleteHash(
            model: hashesModel,
          ),
        );
        Navigator.pop(context);
      },
    );
  }
}
