// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Label _$LabelFromJson(Map<String, dynamic> json) => Label(
      name: json['name'] as String,
      color: const ColorSerialiser().fromJson(json['color'] as String),
    );

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
      'name': instance.name,
      'color': const ColorSerialiser().toJson(instance.color),
    };
