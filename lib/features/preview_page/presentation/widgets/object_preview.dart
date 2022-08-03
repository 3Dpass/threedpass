// ignore_for_file: avoid_dynamic_calls, library_prefixes

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gl/flutter_gl.dart';
import 'package:three_dart/three_dart.dart' as THREE;
import 'package:three_dart_jsm/three_dart_jsm.dart' as THREE_JSM;
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class ObjectPreview extends StatefulWidget {
  const ObjectPreview({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final Snapshot snapshot;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ObjectPreview> {
  late final Size screenSize;
  late final double dpr; // Device Pixel Ratio
  bool isRendered = false;

  final FlutterGlPlugin three3dRender = FlutterGlPlugin();
  late final THREE.WebGLRenderer renderer;
  late final THREE.WebGLRenderTarget renderTarget;
  late final int sourceTexture;

  late final THREE.Scene scene;
  late final THREE.Camera camera;
  late final THREE.Mesh mesh;
  late final THREE.Object3D object;
  late final THREE.Texture texture;

  static const double maxObjectSize = 100;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _init();
  }

  double get height => 250;
  double get width => screenSize.width - 16 * 2;

  Future<void> _init() async {
    if (!_objectFileExists) {
      return;
    }

    final mqd = MediaQuery.of(context);

    screenSize = mqd.size;
    dpr = mqd.devicePixelRatio;

    Map<String, dynamic> _options = {
      'antialias': true,
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

  initRenderer() {
    Map<String, dynamic> _options = {
      'width': width,
      'height': height,
      'gl': three3dRender.gl,
      'antialias': true,
      'canvas': three3dRender.element,
      'alpha': true,
    };

    renderer = THREE.WebGLRenderer(_options);
    renderer.setPixelRatio(dpr);
    renderer.setSize(width, height, false);
    renderer.shadowMap.enabled = false;

    var pars = THREE.WebGLRenderTargetOptions({'format': THREE.RGBAFormat});
    renderTarget = THREE.WebGLRenderTarget(
      (width * dpr).toInt(),
      (height * dpr).toInt(),
      pars,
    );
    renderTarget.samples = 4;
    renderer.setRenderTarget(renderTarget);
    sourceTexture = renderer.getRenderTargetGLTexture(renderTarget);
  }

  initPage() async {
    camera = THREE.PerspectiveCamera(45, width / height, 1, 1000);
    camera.position.z = 200;

    // scene
    scene = THREE.Scene();

    // light
    var ambientLight = THREE.AmbientLight(0xcccccc, 0.4);
    scene.add(ambientLight);

    var pointLight = THREE.PointLight(0xffffff, 0.8);
    camera.add(pointLight);
    scene.add(camera);

    // texture
    var textureLoader = THREE.TextureLoader(null);
    textureLoader.flipY = true;
    texture = await textureLoader.loadAsync('assets/textures/space.jpeg', null);

    texture.magFilter = THREE.LinearFilter;
    texture.minFilter = THREE.LinearMipmapLinearFilter;
    texture.generateMipmaps = true;
    texture.needsUpdate = true;
    texture.flipY = true; // this flipY is only for web

    // obj
    var loader = THREE_JSM.OBJLoader(null);
    object = await loader.loadAsync(widget.snapshot.externalPathToObj);
    object.traverse((child) {
      if (child is THREE.Mesh) {
        child.material.map = texture;
      }
    });

    // scale
    final actualModel = object.children.first;
    actualModel.geometry?.computeBoundingBox();
    final box3 = THREE.Box3(
      actualModel.geometry?.boundingBox?.min,
      actualModel.geometry?.boundingBox?.max,
    );
    final measure = THREE.Vector3();
    box3.getSize(measure); // set value to [measure] variable
    // actualModel.material = THREE.MeshPhongMaterial({
    //   'color': 0xffffff,
    //   'specular': 0x111111,
    //   'shininess': 100,
    //   'map': texture,
    //   'side': THREE.DoubleSide,
    // });

    final maxCoord = max(max(measure.x, measure.y), measure.z);
    final scale = maxObjectSize / maxCoord;
    object.scale.set(scale, scale, scale);

    // Center object
    var boxObject = THREE.Box3().setFromObject(object);
    var center = THREE.Vector3();
    boxObject.getCenter(center);
    object.position.sub(center); // center the model

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

    scene.add(object);

    await render();
  }

  render() async {
    int _t = DateTime.now().millisecondsSinceEpoch;

    // This variable is unused, but NEVER DELETE IT!!
    final _gl = three3dRender.gl;

    renderer.render(scene, camera);

    int _t1 = DateTime.now().millisecondsSinceEpoch;

    print('render cost: ${_t1 - _t} ');
    print(renderer.info.memory);
    print(renderer.info.render);

    // 重要 更新纹理之前一定要调用 确保gl程序执行完毕
    _gl.flush();

    three3dRender.updateTexture(sourceTexture);

    setState(() {
      isRendered = true;
    });
  }

  SnackBar errorSnackBar() => SnackBar(
        content: Text(
          '.obj file for "${widget.snapshot.name}" does not exists. Path: ${widget.snapshot.externalPathToObj}',
        ),
      );

  bool get _objectFileExists {
    return widget.snapshot.externalPathToObj != null &&
        File(widget.snapshot.externalPathToObj!).existsSync();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: isRendered
          ? Texture(textureId: three3dRender.textureId!)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    three3dRender.dispose();
    // renderer.dispose();
    // renderTarget.dispose();
    // scene.dispose();
    // camera.dispose();
    // // mesh.dispose();
    // object.dispose();
    // texture.dispose();

    super.dispose();
  }
}
