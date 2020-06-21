// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comic _$ComicFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'api_detail_url',
    'date_added',
    'issue_number',
    'image',
    'volume'
  ]);
  return Comic(
    apiDetailUrl: json['api_detail_url'] as String,
    dateAdded: json['date_added'] as String,
    issueNumber: json['issue_number'] as String,
    image: json['image'] == null
        ? null
        : ComicImage.fromJson(json['image'] as Map<String, dynamic>),
    volume: json['volume'] == null
        ? null
        : ComicVolume.fromJson(json['volume'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'date_added': instance.dateAdded,
      'issue_number': instance.issueNumber,
      'image': instance.image,
      'volume': instance.volume,
      'name': instance.name,
    };
