import 'dart:io';

import 'package:app/core/api_manager/endPoints.dart';
import 'package:app/core/helpers/cache_helper.dart';
import 'package:app/data/data_source/uploud_image_data_source/uploud_image_data_source.dart';
import 'package:dio/dio.dart';

import 'package:image_picker/image_picker.dart';

class UploudImageDataSourceImp implements UploudImageDataSource {
  final Dio dio;

  UploudImageDataSourceImp(this.dio);
  Future<Response> uploudImages(XFile? file) async {
    String token = await CacheHelper.getData(key: 'token');

    FormData formData = FormData.fromMap({
      'img': await MultipartFile.fromFile(file!.path,
          filename: file!.path.split('/').last),
    });

    // Optionally, add headers if needed
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.post(
      EndPoints.uplodeImage,
      data: formData,
    );

    return response;
  }
}
