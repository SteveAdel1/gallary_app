
import 'package:app/data/data_source/gellary_data_source/gellary_data_source.dart';
import 'package:app/data/models/gallery_model/gallary_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/failure/failure.dart';
import '../../../core/failure/server_failure.dart';
import '../../../domain/repo/gallery_repo/gallery_repo.dart';


class GalleryRepoImp implements GalleryRepo{

  GalleryDataSource galleryDataSource;


  GalleryRepoImp(this.galleryDataSource);

  @override
  Future<Either<Failure, GalleryModel>> getGalleryData() async{
      try{
        var response= await galleryDataSource.getGalleryDataList();

        if(response.statusCode == 200){
          late GalleryModel galleryDataList;
          dynamic res  = response.data ;
            galleryDataList = GalleryModel.fromJson(res);

          print(response.data);

          return right(galleryDataList);
        }
        else{
          return left(
              ServerFailure(statusCode: response.statusCode.toString())
          );
        }
      }on DioException catch(error){
        return left(ServerFailure(statusCode: error.response?.statusCode.toString()?? ""));
      }
    }
  }
