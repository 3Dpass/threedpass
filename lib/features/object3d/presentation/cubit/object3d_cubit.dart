import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:threedpass/features/object3d/domain/entities/model3d.dart';

part 'object3d_state.dart';

class Object3dCubit extends Cubit<Object3dState> {
  Object3dCubit() : super(Object3dInitial());

  void loadModel(String path) {
    if (path.startsWith('assets')) {
      // Load from app assets
      rootBundle.loadString(path).then((value) {
        final model = Model3D();
        model.loadFromString(value);
        emit(Object3dModelLoaded(model: model));
      });
    } else {
      // Load from external
      File(path).readAsString().then((value) {
        final model = Model3D();
        model.loadFromString(value);
        emit(Object3dModelLoaded(model: model));
      });
    }
  }

  void setInitial() {
    emit(Object3dInitial());
  }
}
