import 'package:app/core/failure/failure.dart';
import 'package:app/domain/repo/login_repo/login_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  LoginRepo loginRepo ;

  LoginUseCase(this.loginRepo);
  Future<Either<Failure , bool>>execute(String email , String password)async{
    return await loginRepo.Login(email, password);
  }
}