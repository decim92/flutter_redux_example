import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:redux_example/model/comic/comic_image.dart';
import 'package:redux_example/model/comic/comic_volume.dart';

part 'comic.g.dart';

@JsonSerializable()
class Comic {
  @JsonKey(name: 'api_detail_url', required: true)
  final String apiDetailUrl;
  @JsonKey(name: 'date_added', required: true)
  final String dateAdded;
  @JsonKey(name: 'issue_number', required: true)
  final String issueNumber;
  @JsonKey(name: 'image', required: true)
  final ComicImage image;
  @JsonKey(name: 'volume', required: true)
  final ComicVolume volume;
  @JsonKey(name: 'name', nullable: true)
  final String name;

  Comic({
    @required this.apiDetailUrl,
    @required this.dateAdded,
    @required this.issueNumber,
    @required this.image,
    @required this.volume,
    this.name,
  });

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  Map<String, dynamic> toJson() => _$ComicToJson(this);
}
