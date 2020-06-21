import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_volume.g.dart';

@JsonSerializable()
class ComicVolume {
  @JsonKey(name: 'name', required: true)
  final String name;

  ComicVolume({
    @required this.name,
  });

  factory ComicVolume.fromJson(Map<String, dynamic> json) =>
      _$ComicVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVolumeToJson(this);
}
