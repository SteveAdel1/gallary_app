import 'package:app/core/failure/failure.dart';
import 'package:app/core/failure/server_failure.dart';
import 'package:app/data/data_source/uploud_image_data_source/uploud_image_data_source.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:dio/src/response.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/repo/uploud_repo/uploud_image_repo.dart';

class UploudImageRepoImp implements UploudImageRepo {
  final UploudImageDataSource dataSource;
  UploudImageRepoImp(this.dataSource);

  @override
  Future<Either<Failure, Response>> uploudImageRepo(XFile? file) async {
    try {
      final response = await dataSource.uploudImages(file);
      if (response.statusCode == 200) {
        return right(response);
      } else if (response.statusCode == 401) {
        return left(ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"]));
      } else if (response.statusCode != 200) {
        return left(ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"]));
      } else {
        return left(ServerFailure(statusCode: response.statusCode.toString()));
      }
    } on DioException catch (error) {
      return left(ServerFailure(
          statusCode: error.response!.statusCode.toString(),
          message: error.response?.data["message"] ?? ""));
    }
  }
}
