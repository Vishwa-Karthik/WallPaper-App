// To parse this JSON data, do
//
//     final wallpaper = wallpaperFromJson(jsonString);

import 'dart:convert';

Wallpaper wallpaperFromJson(String str) => Wallpaper.fromJson(json.decode(str));

String wallpaperToJson(Wallpaper data) => json.encode(data.toJson());

class Wallpaper {
  Wallpaper({
    required this.id,
    required this.url,
    required this.photographer,
    required this.src,
  });

  int id;
  String url;
  String photographer;
  Src src;

  factory Wallpaper.fromJson(Map<String, dynamic> json) => Wallpaper(
        id: json["id"],
        url: json["url"],
        photographer: json["photographer"],
        src: Src.fromJson(json["src"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "photographer": photographer,
        "src": src.toJson(),
      };
}

class Src {
  Src({
    required this.large2X,
    required this.large,
    required this.tiny,
  });

  String large2X;
  String large;
  String tiny;

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        large2X: json["large2x"],
        large: json["large"],
        tiny: json["tiny"],
      );

  Map<String, dynamic> toJson() => {
        "large2x": large2X,
        "large": large,
        "tiny": tiny,
      };
}
