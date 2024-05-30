import 'package:image_picker/image_picker.dart';

sealed class ImageStates {}

class LoadingImageState extends ImageStates {}

class LoadingUpload extends ImageStates {}

class SuccessImagesState extends ImageStates {
  XFile? image;
  SuccessImagesState(this.image);
}

class SuccessUpload extends ImageStates {}

class ErrorImageState extends ImageStates {
  String errorMassage;
  ErrorImageState(this.errorMassage);
}
