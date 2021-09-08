import 'dart:convert';

List<Gallery> galleryFromJson(String str) => List<Gallery>.from(json.decode(str).map((x) => Gallery.fromJson(x)));

String galleryToJson(List<Gallery> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gallery {
  Gallery({
    required this.id,
    required this.name,
    required this.images,
  });

  final int id;
  final String name;
  final List<ImageData> images;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    id: json["id"],
    name: json["name"],
    images: List<ImageData>.from(json["images"].map((x) => ImageData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class ImageData {
  ImageData({
    required this.id,
    required this.url,
  });

  final int id;
  final String url;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
    id: json["id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
  };
}
