// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueDetail _$IssueDetailFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'character_credits',
    'team_credits',
    'location_credits',
    'image'
  ]);
  return IssueDetail(
    characterCredits: (json['character_credits'] as List)
        ?.map((e) =>
            e == null ? null : Credit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    teamCredits: (json['team_credits'] as List)
        ?.map((e) =>
            e == null ? null : Credit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    locationCredits: (json['location_credits'] as List)
        ?.map((e) =>
            e == null ? null : Credit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    image: json['image'] == null
        ? null
        : ComicImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IssueDetailToJson(IssueDetail instance) =>
    <String, dynamic>{
      'character_credits': instance.characterCredits,
      'team_credits': instance.teamCredits,
      'location_credits': instance.locationCredits,
      'image': instance.image,
    };
