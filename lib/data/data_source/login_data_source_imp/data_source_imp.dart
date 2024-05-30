import 'package:app/core/api_manager/endPoints.dart';
import 'package:app/data/data_source/login_data_source/login_data_source.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

class LoginDataSourceImp extends LoginDataSource{

  final Dio dio;

  LoginDataSourceImp(this.dio);

  @override
    Future<Response> login(String email , String password) async{
      return await dio.post(
          EndPoints.login,
          data: {
            "email" : email ,
            "password" : password
          }
      );

    }
  }

