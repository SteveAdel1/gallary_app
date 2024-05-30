import 'package:dio/dio.dart';

abstract class GalleryDataSource{

  Future<Response> getGalleryDataList();
}