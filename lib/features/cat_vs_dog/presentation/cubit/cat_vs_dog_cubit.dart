import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:meta/meta.dart';

part 'cat_vs_dog_state.dart';

class CatVsDogCubit extends Cubit<CatVsDogState> {
  CatVsDogCubit() : super(CatVsDogState.initial());

  Future<void> pickImageFromGallery() async {
    final _pickedFile = await state.imagePicker.getImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
      imageQuality: 90,
    );

    if (_pickedFile != null) {
      emit(
        state.copyWith(pickedImage: File(_pickedFile.path)),
      );

      classifyImage(image: File(_pickedFile.path));
    }
  }

  Future<void> takeImageFromCamera() async {
    final _pickedFile = await state.imagePicker.getImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      maxHeight: 1024,
      maxWidth: 1024,
      imageQuality: 90,
    );

    if (_pickedFile != null) {
      emit(
        state.copyWith(pickedImage: File(_pickedFile.path)),
      );

      classifyImage(image: File(_pickedFile.path));
    }
  }

  void disposeModel() {
    Tflite.close();
  }

  void loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  void classifyImage({@required File image}) async {
    var _output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    emit(state.copyWith(
      analyseResult: _output,
      isLoading: false,
    ));
  }
}
