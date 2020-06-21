import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_image.g.dart';

@JsonSerializable()
class ComicImage {
  @JsonKey(name: 'original_url', required: true)
  final String originalUrl;

  ComicImage({
    @required this.originalUrl,
  });

  factory ComicImage.fromJson(Map<String, dynamic> json) =>
      _$ComicImageFromJson(json);

  Map<String, dynamic> toJson() => _$ComicImageToJson(this);
}
