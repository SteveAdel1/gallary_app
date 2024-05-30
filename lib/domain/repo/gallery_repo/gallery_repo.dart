import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../data/models/gallery_model/gallary_model.dart';

abstract class GalleryRepo {
  Future<Either<Failure,GalleryModel>> getGalleryData();
}