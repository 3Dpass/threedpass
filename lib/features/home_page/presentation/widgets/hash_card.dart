import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/home_page/presentation/widgets/hash_card_popup_menu.dart';

class HashCard extends StatelessWidget {
  final HashesModel hashesModel;
  HashCard({
    Key? key,
    required this.hashesModel,
  }) : super(key: key);

  final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name: ' + hashesModel.name),
                Text('Stamp: ' + formatter.format(hashesModel.stamp)),
              ],
            ),
            Spacer(),
            HashCardPopUpMenuButton(hashesModel: hashesModel),
          ],
        ),
      ),
    );
  }
}
