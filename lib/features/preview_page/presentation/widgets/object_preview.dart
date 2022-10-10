// ignore_for_file: avoid_dynamic_calls, library_prefixes

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gl/flutter_gl.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:three_dart/three_dart.dart' as THREE;
import 'package:three_dart_jsm/three_dart_jsm.dart' as THREE_JSM;
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';

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
  late final Size screenSize;
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
    three3dRender.dispose();
    renderer.dispose();
    renderTarget.dispose();
    scene.dispose();
    camera.dispose();
    // mesh.dispose();
    object.dispose();
    texture.dispose();

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

  void initRenderer() {
    final Map<String, dynamic> _options = {
      'width': width,
      'height': height,
      'gl': three3dRender.gl,
      'antialias': previewSettings.antialias,
      'canvas': three3dRender.element,
      'alpha': true,
    };

    renderer = THREE.WebGLRenderer(_options);
    renderer.setPixelRatio(dpr);
    renderer.setSize(width, height, false);
    renderer.shadowMap.enabled = false;

    final pars = THREE.WebGLRenderTargetOptions({'format': THREE.RGBAFormat});
    renderTarget = THREE.WebGLRenderTarget(
      (width * dpr).toInt(),
      (height * dpr).toInt(),
      pars,
    );
    renderTarget.samples = 0;

    renderer.setRenderTarget(renderTarget);
    sourceTexture = renderer.getRenderTargetGLTexture(renderTarget);
  }

  void initScene() {
    // scene
    scene = THREE.Scene();
    scene.background = THREE.Color(Theme.of(context).canvasColor.value);
  }

  void initCamera() {
    // camera
    camera = THREE.PerspectiveCamera(45, width / height, 1, 1000);
    camera.position.z = 250;
    scene.add(camera);
  }

  void initControls() {
    // controls
    controls = THREE_JSM.ArcballControls(camera, _globalKey, scene, 1);
    controls.addEventListener('change', (final event) {
      render();
    });
  }

  void initLight() {
    // light
    final ambientLight = THREE.AmbientLight(0xcccccc, 0.4);
    scene.add(ambientLight);

    final pointLight = THREE.PointLight(0xffffff, 0.8);
    camera.add(pointLight);
  }

  Future<void> initTexture() async {
    // texture
    final textureLoader = THREE.TextureLoader(null);
    textureLoader.flipY = true;
    texture = await textureLoader.loadAsync('assets/textures/space.jpeg', null);

    texture.magFilter = THREE.LinearFilter;
    texture.minFilter = THREE.LinearMipmapLinearFilter;
    texture.generateMipmaps = true;
    texture.needsUpdate = true;
    texture.flipY = true; // this flipY is only for web
  }

  Future<void> initObj() async {
    await loadObj();
    await scaleObj();
    await centerObj();

    scene.add(object);
  }

  Future<void> loadObj() async {
    final loader = THREE_JSM.OBJLoader(null);
    object = await loader.loadAsync(widget.snapshot.externalPathToObj)
        as THREE.Object3D;
    object.traverse((final dynamic child) {
      if (child is THREE.Mesh) {
        child.material.map = texture;
      }
    });
  }

  Future<void> scaleObj() async {
    final actualModel = object.children.first;
    actualModel.geometry?.computeBoundingBox();
    final box3 = THREE.Box3(
      actualModel.geometry?.boundingBox?.min,
      actualModel.geometry?.boundingBox?.max,
    );
    final measure = THREE.Vector3();
    box3.getSize(measure); // set value to [measure] variable

    final maxCoord = max(max(measure.x, measure.y), measure.z);
    final scale = maxObjectSize / maxCoord;
    object.scale.set(scale, scale, scale);
  }

  Future<void> centerObj() async {
    final boxObject = THREE.Box3().setFromObject(object);
    final center = THREE.Vector3();
    boxObject.getCenter(center);
    object.position.sub(center); // center the model
  }

  // do NOT delete this code
  // ignore: no-empty-block
  void initMesh() {
    // final textureCube = THREE.CubeTexture(
    //   [
    //     'assets/textures/space.jpeg'
    //         'assets/textures/space.jpeg'
    //         'assets/textures/space.jpeg'
    //         'assets/textures/space.jpeg'
    //         'assets/textures/space.jpeg'
    //         'assets/textures/space.jpeg'
    //   ],
    // );
    // // textureCube. = THREE.MirroredRepeatWrapping;
    // textureCube.mapping = THREE.CubeRefractionMapping;

    // final _meshMaterialOptions = {
    //   'color': 0xffffff,
    //   'roughness': 0.8,
    //   // VALUES ARE NOT SUPPORTED
    //   // 'envMap': textureCube,
    //   // 'refractionRatio': 0.7,
    //   'map': texture,
    //   'reflectivity': 1,
    //   'flatShading': true,
    // };

    // final meshPhongMaterial = THREE.MeshPhongMaterial(_meshMaterialOptions);
    // // meshPhongMaterial.envMap = textureCube;
    // // meshPhongMaterial.refractionRatio = 0.7;

    // mesh = THREE.Mesh(actualModel.geometry, meshPhongMaterial);
    // mesh.position.sub(center);

    // scene.add(mesh);
  }

  Future<void> initPage() async {
    // Init stuff
    initScene();
    initCamera();
    initControls();
    initLight();
    await initTexture();
    await initObj();
    initMesh();

    // Render it
    await render();
  }

  Future<void> render() async {
    final int _t = DateTime.now().millisecondsSinceEpoch;

    // This variable is unused, but NEVER DELETE IT!!
    final _gl = three3dRender.gl;

    controls.update();

    renderer.render(scene, camera);

    final int _t1 = DateTime.now().millisecondsSinceEpoch;

    print('render cost: ${_t1 - _t} ');
    print(renderer.info.memory);
    print(renderer.info.render);

    // 重要 更新纹理之前一定要调用 确保gl程序执行完毕
    _gl.flush();

    await three3dRender.updateTexture(sourceTexture);

    setState(() {
      isRendered = true;
    });
  }

  SnackBar errorSnackBar() => SnackBar(
        content: Text(
          '.obj file for "${widget.snapshot.name}" does not exists. Path: ${widget.snapshot.externalPathToObj}',
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
    return widget.snapshot.externalPathToObj != null &&
        File(widget.snapshot.externalPathToObj!).existsSync();
  }

  @override
  Widget build(final BuildContext context) {
    // There is an important part. When user interact with the
    //[THREE_JSM] contorller, the outer controller of the PreviewPage
    // is triggered. So I put controls inside the [SingleChildScrollView],
    // but the [SingleChildScrollView] controller has to
    // detect the lack of space to be triggered. That's why I used SizedBox
    // with heitgh-1 and removed the glow.
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
