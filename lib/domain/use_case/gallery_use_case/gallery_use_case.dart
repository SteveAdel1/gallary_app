import 'package:app/core/failure/failure.dart';
import 'package:app/data/models/gallery_model/gallary_model.dart';
import 'package:app/domain/repo/gallery_repo/gallery_repo.dart';
import 'package:dartz/dartz.dart';

class GalleryUseCase{
  GalleryRepo galleryRepo;

  GalleryUseCase(this.galleryRepo);

  Future<Either<Failure, GalleryModel>> execute() async{
    return await galleryRepo.getGalleryData();
  }
}