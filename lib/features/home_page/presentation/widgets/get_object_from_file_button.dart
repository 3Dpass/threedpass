import 'dart:developer';

import 'package:calc/calc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/result_page/presentation/pages/result_page.dart';
import 'package:threedpass/features/settings_page/presentation/cubit/settings_page_cubit.dart';

class GetObjectFromFileButton extends StatelessWidget {
  static const allowedExtentions = ['obj', 'stl'];

  /// Get and validate file
  Future<FilePickerResult?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      final filExtension = result.files.first.extension;
      if (filExtension != null && allowedExtentions.contains(filExtension)) {
        return result;
      }
    }
    return null;
  }

  /// Calc hashes
  Future<String> calcHashes(BuildContext context, String filePath) async {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.settings;

    return await Calc.start(
      () {
        log('on calc progress');
      },
      filePath,
      settings.gridSize,
      settings.nSections,
    );
  }

  void showProgressDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: new Row(
          children: [
            CircularProgressIndicator(),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Text("Calculating hashes..."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Calc object
  Future<void> createHashFromFile(BuildContext context) async {
    final pickerRes = await pickFile();
    if (pickerRes != null) {
      try {
        showProgressDialog(context);

        final objPath = pickerRes.paths.first!;

        final hashes = await calcHashes(
          context,
          objPath,
        );

        Navigator.pop(context);

        // TODO Change to auto_route
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ResultPage(
              hashesModel: HashesModel(
                name: 'New object ${DateTime.now().toIso8601String()}',
                hashes: hashes.split('\n'),
                stamp: DateTime.now(),
                externalPathToObj: objPath,
              ),
            ),
          ),
        );
      } catch (e) {
        // TODO Calc does not work on x86_64 devices
        logger.e(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('File picker error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: AppButtonStyles.primaryButton,
      icon: Icon(Icons.folder_open),
      label: Text('Get from file'),
      onPressed: () => createHashFromFile(context),
    );
  }
}
