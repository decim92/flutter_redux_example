// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credit _$CreditFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['name', 'api_detail_url']);
  return Credit(
    name: json['name'] as String,
    apiDetailUrl: json['api_detail_url'] as String,
  );
}

Map<String, dynamic> _$CreditToJson(Credit instance) => <String, dynamic>{
      'name': instance.name,
      'api_detail_url': instance.apiDetailUrl,
    };
