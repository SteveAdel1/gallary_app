import 'package:app/core/failure/failure.dart';
import 'package:app/core/helpers/cache_helper.dart';
import 'package:app/data/data_source/login_data_source/login_data_source.dart';
import 'package:app/domain/repo/login_repo/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/api_manager/web_service.dart';
import '../../../core/failure/server_failure.dart';

class LoginRepoImp implements LoginRepo{
  LoginDataSource loginDataSource ;

  LoginRepoImp(this.loginDataSource);

  @override
  Future<Either<Failure, bool>> Login(String email, String password) async {
    try{
      final response = await loginDataSource.login(email, password);

      if(response.statusCode == 200){

        WebServices().setMobileToken(response.data["token"]);
        CacheHelper.saveData(key: 'name', value: response.data["user"]["name"]);
        CacheHelper.saveData(key: 'email', value: response.data["user"]["email"]);
        CacheHelper.saveData(key: 'token', value: response.data["token"]);

        return Right(true);

      }else if(response.statusCode==401){
        return Left(
            ServerFailure(statusCode: response.statusCode.toString(),
                message: response.data["message"]
            )
        );
      }else if(response.statusCode==400){
        return Left(
            ServerFailure(statusCode: response.statusCode.toString(),
                message: response.data["message"]
            )
        );
      }
      else if(response.statusCode == 400){
        return Left(
            ServerFailure(statusCode: response.statusCode.toString(),
                message: response.data["message"]
            )
        );
      } else{
        return Left(
            ServerFailure(statusCode: response?.statusCode.toString() ?? "",
                message: response?.data["message"] ?? ""
            )
        );
      }
    }on DioException catch(error){
      return Left(
          ServerFailure(statusCode: error.response!.statusCode.toString(),
              message: error.response?.data["message"] ?? ""
          )
      );
    }

  }

}