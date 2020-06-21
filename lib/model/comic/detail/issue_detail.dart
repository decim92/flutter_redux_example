import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:redux_example/model/comic/detail/credit.dart';
import 'package:redux_example/model/comic/comic_image.dart';

part 'issue_detail.g.dart';

@JsonSerializable()
class IssueDetail {
  @JsonKey(name: 'character_credits', required: true)
  final List<Credit> characterCredits;
  @JsonKey(name: 'team_credits', required: true)
  final List<Credit> teamCredits;
  @JsonKey(name: 'location_credits', required: true)
  final List<Credit> locationCredits;
  @JsonKey(name: 'image', required: true)
  final ComicImage image;

  IssueDetail({
    @required this.characterCredits,
    @required this.teamCredits,
    @required this.locationCredits,
    @required this.image,
  });

  factory IssueDetail.fromJson(Map<String, dynamic> json) =>
      _$IssueDetailFromJson(json);

  Map<String, dynamic> toJson() => _$IssueDetailToJson(this);
}
