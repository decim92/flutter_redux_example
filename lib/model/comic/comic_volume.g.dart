// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_volume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicVolume _$ComicVolumeFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['name']);
  return ComicVolume(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ComicVolumeToJson(ComicVolume instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
