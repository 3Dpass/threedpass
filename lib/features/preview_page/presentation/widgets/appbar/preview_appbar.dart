import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/core/widgets/app_back_button.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class PreviewAppBar extends AppBar {
  PreviewAppBar({
    required final Snapshot snapshot,
    final Key? key,
    final HashObject? hashObject,
  }) : super(
          key: key,
          backgroundColor: Colors.black,
          titleSpacing: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const AppBackButton(),
              hashObject != null
                  ? Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          hashObject.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  : Text('get_new_object_appbar'.tr()),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.share),
                alignment: Alignment.center,
                onPressed: () => Share.share(snapshot.shareText),
              ),
            ],
          ),
        );
}
