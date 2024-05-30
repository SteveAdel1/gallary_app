import '../../../../data/models/gallery_model/gallary_model.dart';

sealed class GalleryStates {}

class LoadingGalleryState extends GalleryStates {}

class SuccessGalleryState extends GalleryStates {
  GalleryModel galleryList ;
  SuccessGalleryState(this.galleryList);
}
class ErrorGalleryState extends GalleryStates {}
