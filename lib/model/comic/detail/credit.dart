import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credit.g.dart';

@JsonSerializable()
class Credit {
  @JsonKey(name: 'name', required: true)
  final String name;
  @JsonKey(name: 'api_detail_url', required: true)
  final String apiDetailUrl;

  Credit({
    @required this.name,
    @required this.apiDetailUrl,
  });

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);

  Map<String, dynamic> toJson() => _$CreditToJson(this);
}
