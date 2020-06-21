import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_image.g.dart';

@JsonSerializable()
class ComicImage {
  @JsonKey(name: 'original_url', required: true)
  final String originalUrl;
  @JsonKey(name: 'screen_large_url', required: true)
  final String screenLargeUrl;

  ComicImage({
    @required this.originalUrl,
    @required this.screenLargeUrl,
  });

  factory ComicImage.fromJson(Map<String, dynamic> json) =>
      _$ComicImageFromJson(json);

  Map<String, dynamic> toJson() => _$ComicImageToJson(this);
}
