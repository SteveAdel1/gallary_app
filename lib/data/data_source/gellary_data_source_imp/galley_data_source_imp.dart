import 'package:app/core/helpers/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

import '../../../core/api_manager/endPoints.dart';
import '../gellary_data_source/gellary_data_source.dart';


class GalleryDataSourceImp extends GalleryDataSource{
  @override

  final Dio dio;

  GalleryDataSourceImp(this.dio);
  @override
  Future<Response> getGalleryDataList() async{

    // Response r = await dio.post('$baseUrl/services/token',
    //     options: Options(headers: {"authorization":basicAuth}));
    String token =await CacheHelper.getData(key: 'token');
    return await dio.get(EndPoints.myGallary,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization":
          "Bearer ${token}",
        })
    );
  }

}