import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/store.dart';

class HashCardPopUpMenuButton extends StatelessWidget {
  final HashesModel hashesModel;

  const HashCardPopUpMenuButton({
    required this.hashesModel,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: Colors.grey),
      onSelected: (value) {
        switch (value) {
          case 1:
            Share.share(hashesModel.hashes.join("\n"));
            break;
          case 2:
            BlocProvider.of<HashesListBloc>(context).add(
              DeleteHash(
                model: hashesModel,
              ),
            );
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(Icons.share, color: Colors.grey),
                ),
                Text('Share')
              ],
            )),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(Icons.delete, color: Colors.grey)),
              Text('Delete')
            ],
          ),
        ),
      ],
    );
  }
}
