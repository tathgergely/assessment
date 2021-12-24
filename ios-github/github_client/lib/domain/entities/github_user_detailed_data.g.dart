// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user_detailed_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubUserDetailedData _$GithubUserDetailedDataFromJson(
        Map<String, dynamic> json) =>
    GithubUserDetailedData(
      loginName: json['login'] as String,
      avatar: json['avatar_url'] as String,
    );

Map<String, dynamic> _$GithubUserDetailedDataToJson(
        GithubUserDetailedData instance) =>
    <String, dynamic>{
      'login': instance.loginName,
      'avatar_url': instance.avatar,
    };
