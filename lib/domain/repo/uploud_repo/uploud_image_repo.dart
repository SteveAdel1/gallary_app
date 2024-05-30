import 'package:app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class UploudImageRepo {
  Future<Either<Failure, Response>> uploudImageRepo(XFile? file);
}
