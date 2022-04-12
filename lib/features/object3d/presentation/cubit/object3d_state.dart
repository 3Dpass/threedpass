part of 'object3d_cubit.dart';

abstract class Object3dState {
  const Object3dState();
}

class Object3dInitial extends Object3dState {
  const Object3dInitial();
}

class Object3dModelLoaded extends Object3dState {
  final Model3D model;
  const Object3dModelLoaded({
    required this.model,
  });
}
