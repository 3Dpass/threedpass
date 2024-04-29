import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot_create_from_file/snapshot_create_from_file.dart';
import 'package:threedpass/features/scan_page/bloc/scan_isolate_cubit.dart';
// import 'package:threedpass/features/scan_page/presentation/widgets/get_object_from_file_button.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

import './test_app.dart';

void main() {
  // config();
  final app = TestApp.instance;

  group('Example test', () {
    testWidgets('MyWidget has a title and message', (final tester) async {
      print('aaaaaaa1');
      // Initial pump
      await tester.pumpWidget(app);
      print('aaaaaaa2');

      final filePath = '${Directory.current.path}/resources/3dpass-487203.obj';
      // final Uri basedir = (goldenFileComparator. as LocalFileComparator).basedir;
      // matchesGoldenFile(key)
      // print(basedir.path);

      // final file = await rootBundle.load(filePath);
      // print(file.lengthInBytes);

      var dir = Directory.current;
      while (!await dir
          .list()
          .any((final entity) => entity.path.endsWith('pubspec.yaml'))) {
        dir = dir.parent;
      }

      print(dir.absolute);
      print(Directory.current.listSync(recursive: true));
      print(filePath);
      print(File(filePath).existsSync());
      // for (var i in tester.allElements) {
      //   print(i.widget.runtimeType);
      // }
      final BuildContext context = tester.element(find.byType(SizedBox));

      final snapFactory = SnapshotFileFactory(
        // showLoader: () {},
        hashesListBloc: BlocProvider.of<HashesListBloc>(context),
        scanSettings:
            BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings,
        // objectsDirectory: getIt<ObjectsDirectory>(),
        scanIsolateCubit: BlocProvider.of<ScanIsolateCubit>(context),
        // recievePort: recievePort,
      );

      final pair = await snapFactory.createSnapshotFromFile(
        pickedFilePath: filePath,
        relativePath: filePath,
      );

      await context.router.push(
        PreviewRouteWrapper(
          hashObject: pair.left,
          snapshot: pair.right,
          createNewAnyway: true,
        ),
      );

      print('aaaaaaa3');

      await tester.pumpAndSettle();

      print('aaaaaaa4');
    });
  });
}
