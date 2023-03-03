part of 'object_preview.dart';

extension ___ on _State {
  void initScene() {
    // scene
    scene = THREE.Scene();
    final currentScaffoldBG =
        Theme.of(context).customColors.scaffoldBackground.value;
    scene.background = THREE.Color(currentScaffoldBG);
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
}
