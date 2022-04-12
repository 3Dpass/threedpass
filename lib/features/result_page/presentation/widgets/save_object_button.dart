import 'package:flutter/material.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/result_page/presentation/widgets/save_dialog.dart';

class SaveObjectButton extends StatelessWidget {
  const SaveObjectButton({
    required this.hashesModel,
  });

  final HashesModel hashesModel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.primaryButton,
      child: Text('Save this object'),
      onPressed: () async {
        showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) => SaveDialog(
            hashesModelToSave: hashesModel,
          ),
        );
      },
    );
  }
}
