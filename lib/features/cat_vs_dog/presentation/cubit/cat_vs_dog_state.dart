part of 'cat_vs_dog_cubit.dart';

class CatVsDogState {
  final File pickedImage;
  final List analyseResult;
  final ImagePicker imagePicker;
  final bool hasImage;

  final bool isLoading;
  // final bool isGalleryButtonEnabled;
  // final bool isCameraButtonEnabled;

  CatVsDogState({
    @required this.pickedImage,
    @required this.analyseResult,
    @required this.imagePicker,
    @required this.hasImage,
    @required this.isLoading,
    // required this.isGalleryButtonEnabled,
    // required this.isCameraButtonEnabled,
  });

  factory CatVsDogState.initial() => CatVsDogState(
        pickedImage: null,
        analyseResult: null,
        imagePicker: ImagePicker(),
        hasImage: false,
        isLoading: false,
        // isGalleryButtonEnabled: true,
        // isCameraButtonEnabled: true,
      );

  factory CatVsDogState.imagePicked({
    @required prevState,
    @required File image,
  }) =>
      CatVsDogState(
        pickedImage: image,
        analyseResult: prevState.analyseResult,
        imagePicker: prevState.imagePicker,
        hasImage: true,
        isLoading: false,
      );

  CatVsDogState copyWith({
    File pickedImage,
    List analyseResult,
    bool isLoading,
  }) =>
      CatVsDogState(
        imagePicker: this.imagePicker,
        analyseResult: analyseResult ?? this.analyseResult,
        pickedImage: pickedImage ?? this.pickedImage,
        hasImage: true,
        isLoading: isLoading ?? this.isLoading,
      );
}
