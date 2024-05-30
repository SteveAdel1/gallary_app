class GalleryModel {
  List<String> images;

  GalleryModel({
    required this.images,
  });
  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data']['images'] as List<dynamic>;
    List<String> images = [];
    for (int i = 0; i < data.length; i++) {
      images.add(data[i].toString());
    }
    return GalleryModel(
      images: images,
    );
  }
  @override
  String toString() {
    return 'Gallary{images: $images}';
  }
}
