import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/result_page/presentation/widgets/object_preview.dart';
import 'package:threedpass/features/result_page/presentation/widgets/delete_object_button.dart';
import 'package:threedpass/features/result_page/presentation/widgets/hash_properties.dart';
import 'package:threedpass/features/result_page/presentation/widgets/maches_found.dart';
import 'package:threedpass/features/result_page/presentation/widgets/more_info.dart';
import 'package:threedpass/features/result_page/presentation/widgets/save_object_button.dart';
import 'package:threedpass/features/settings_page/presentation/pages/settings_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.hashesModel,
  }) : super(key: key);

  final HashesModel hashesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text("Get a new one"),
            IconButton(
              icon: const Icon(Icons.share, color: Colors.grey),
              alignment: Alignment.centerRight,
              onPressed: () {
                Share.share(hashesModel.shareText);
              },
            )
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: MatchesFound(
                  currentModel: hashesModel,
                ),
              ),
              ObjectPreview(
                hashesModel: hashesModel,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: HashProperties(),
              ),
              SaveObjectButton(
                hashesModel: hashesModel,
              ),
              DeleteObjectButton(
                hashesModel: hashesModel,
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              MoreInfo(
                hashesModel: hashesModel,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const IconButton(
              icon: Icon(Icons.info, color: Colors.grey),
              onPressed: null,
              //title: Container(), //Text("Add"),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.grey),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsPage(),
                  ),
                );
              },
              //title: Container(), //Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
