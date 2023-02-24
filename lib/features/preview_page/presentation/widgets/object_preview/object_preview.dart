// ignore_for_file: avoid_dynamic_calls, library_prefixes

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gl/flutter_gl.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:three_dart/three_dart.dart' as THREE;
import 'package:three_dart_jsm/three_dart_jsm.dart' as THREE_JSM;
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';

part './init_scene_extension.dart';
part './init_object_extension.dart';
part './init_render_extension.dart';

class ObjectPreview extends StatefulWidget {
  const ObjectPreview({
    required this.snapshot,
    final Key? key,
  }) : super(key: key);

  final Snapshot snapshot;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ObjectPreview> {
  /// The logic tryies to scale the biggest dimension of the object to
  /// this number. So if you increase it, all objects will appear bigger.
  static const double maxObjectSize = 100;

  late final THREE.Camera camera;
  late final THREE_JSM.ArcballControls controls;
  late final double dpr; // Device Pixel Ratio
  // Determines if we show object or loader
  bool isRendered = false;

  // late final THREE.Mesh mesh;
  late final THREE.Object3D object;

  late final PreviewSettings previewSettings;
  late final THREE.WebGLRenderTarget renderTarget;
  late final THREE.WebGLRenderer renderer;
  late final THREE.Scene scene;
  late Size screenSize;
  late final int sourceTexture;
  // Prevent from re-init
  bool startedInit = false;

  late final THREE.Texture texture;
  late final FlutterGlPlugin three3dRender = FlutterGlPlugin();

  final GlobalKey<THREE_JSM.DomLikeListenableState> _globalKey =
      GlobalKey<THREE_JSM.DomLikeListenableState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
  }

  @override
  void dispose() {
    if (_objectFileExists) {
      three3dRender.dispose();
      renderer.dispose();
      renderTarget.dispose();
      scene.dispose();
      camera.dispose();
      // mesh.dispose();
      object.dispose();
      texture.dispose();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    previewSettings =
        BlocProvider.of<SettingsConfigCubit>(context).state.previewSettings;
  }

  double get height => 250;

  double get width => screenSize.width - 16 * 2;

  SnackBar errorSnackBar() => SnackBar(
        content: Text(
          '.obj file for "${widget.snapshot.name}" does not exists. Path: ${widget.snapshot.relativePath}',
        ),
      );

  Future<void> init() async {
    if (!_objectFileExists || startedInit) {
      return;
    }

    startedInit = true;

    // init size
    final mqd = MediaQuery.of(context);

    screenSize = mqd.size;
    dpr = mqd.devicePixelRatio * previewSettings.pixelRatio;

    // init three3dRender
    final Map<String, dynamic> _options = {
      'antialias': previewSettings.antialias,
      'alpha': false,
      'width': width.toInt(),
      'height': height.toInt(),
      'dpr': dpr,
    };
    await three3dRender.initialize(options: _options);

    // https://github.com/wasabia/three_dart/blob/c5b4e36c7a6eb489145252a6a52b039344f021be/example/lib/webgl_loader_obj.dart#L72
    // ignore: prefer-extracting-callbacks
    Future.delayed(const Duration(milliseconds: 100), () async {
      await three3dRender.prepareContext();

      initRenderer();
      await initPage();
    });
  }

  bool get _objectFileExists {
    print(
      'FILE EXISTS: ${File(widget.snapshot.realPath).existsSync()} ${widget.snapshot.realPath}',
    );
    return widget.snapshot.realPath != null &&
        File(widget.snapshot.realPath!).existsSync();
  }

  @override
  Widget build(final BuildContext context) {
    // There is an important part. When user interact with the
    //[THREE_JSM] contorller, the outer controller of the PreviewPage
    // is triggered. So I put controls inside the [SingleChildScrollView],
    // but the [SingleChildScrollView] controller has to
    // detect the lack of space to be triggered. That's why I used SizedBox
    // with heitgh-1 and removed the glow.
    screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height - 0.001,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            width: width,
            height: height,
            child: THREE_JSM.DomLikeListenable(
              key: _globalKey,
              builder: (final BuildContext context) => isRendered
                  ? Texture(textureId: three3dRender.textureId!)
                  : Center(
                      child: PlatformCircularProgressIndicator(),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
