import 'package:app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure , bool >> Login(String email , String password);
}