import 'package:app/core/failure/failure.dart';
import 'package:app/domain/repo/uploud_repo/uploud_image_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UploudImageUseCase {
  UploudImageRepo uploudImageRpo;
  UploudImageUseCase(this.uploudImageRpo);
  Future<Either<Failure, Response>> execute(XFile? file) async {
    return await uploudImageRpo.uploudImageRepo(file);
  }
}
