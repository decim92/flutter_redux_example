// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicImage _$ComicImageFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['original_url', 'screen_large_url']);
  return ComicImage(
    originalUrl: json['original_url'] as String,
    screenLargeUrl: json['screen_large_url'] as String,
  );
}

Map<String, dynamic> _$ComicImageToJson(ComicImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
      'screen_large_url': instance.screenLargeUrl,
    };
