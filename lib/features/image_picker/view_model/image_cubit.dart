import 'dart:io';

import 'package:app/core/api_manager/web_service.dart';
import 'package:app/core/failure/server_failure.dart';
import 'package:app/data/data_source/uploud_image_data_source/uploud_image_data_source.dart';
import 'package:app/data/data_source/uploud_image_data_source/uploud_image_data_source_imp.dart';
import 'package:app/data/repo_imp/uploud_image_repo_imp/uploud_image_repo_imp.dart';
import 'package:app/domain/repo/uploud_repo/uploud_image_repo.dart';
import 'package:app/domain/use_case/uploud_image_use_case/uploud_image_use_case.dart';
import 'package:app/features/image_picker/view_model/images_states.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageStates> {
  ImageCubit() : super(LoadingImageState());

  final ImagePicker _imagePicker = ImagePicker();
  late XFile? pickedImage;

  Future<void> pickImage(ImageSource type) async {
    try {
      pickedImage = await _imagePicker.pickImage(source: type);
      if (pickedImage != null) {
        emit(SuccessImagesState(pickedImage));
      } else {
        emit(ErrorImageState("unable to pick image"));
      }
    } catch (e) {
      emit(ErrorImageState(e.toString()));
    }
  }

  Future<void> pickAnotherImage() async {
    emit(LoadingImageState());
  }

  Future<void> uploadImage(XFile file) async {
    emit(LoadingUpload());
    WebServices _webServices = WebServices();
    late UploudImageDataSource dataSource;
    late UploudImageRepo uploudImageRepo;
    late UploudImageUseCase uploudImageUseCase;
    dataSource = UploudImageDataSourceImp(_webServices.freeDio);
    uploudImageRepo = UploudImageRepoImp(dataSource);
    uploudImageUseCase = UploudImageUseCase(uploudImageRepo);
    final result = await uploudImageUseCase.execute(pickedImage);

    return result.fold((fail) {
      var failure = fail as ServerFailure;

      return Future.value(false);
    }, (data) {
      emit(SuccessUpload());

      return Future.value(true);
    });
  }
}
