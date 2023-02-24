// ignore_for_file: avoid_dynamic_calls

part of 'object_preview.dart';

extension _ on _State {
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
    object = await loader.loadAsync(widget.snapshot.realPath) as THREE.Object3D;
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
    final scale = _State.maxObjectSize / maxCoord;
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
}
