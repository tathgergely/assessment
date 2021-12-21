import 'dart:ui';

import 'package:github_client/data/converters/color_serialiser.dart';
import 'package:json_annotation/json_annotation.dart';
part 'label.g.dart';

@JsonSerializable()
class Label {
  const Label({required this.name, required this.color});
  final String name;

  @ColorSerialiser()
  final Color color;

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
