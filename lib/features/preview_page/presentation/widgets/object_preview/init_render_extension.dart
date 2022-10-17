part of 'object_preview.dart';

extension __ on _State {
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
    // ignore: avoid_dynamic_calls
    _gl.flush();

    await three3dRender.updateTexture(sourceTexture);

    // ignore: invalid_use_of_protected_member
    setState(() {
      isRendered = true;
    });
  }
}
