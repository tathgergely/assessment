// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_issue_detailed_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubIssueDetailedData _$GithubIssueDetailedDataFromJson(
        Map<String, dynamic> json) =>
    GithubIssueDetailedData(
      author:
          GithubUserDetailedData.fromJson(json['user'] as Map<String, dynamic>),
      number: json['number'] as int,
      creationDate: DateTime.parse(json['created_at'] as String),
      labels: (json['labels'] as List<dynamic>)
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: $enumDecode(_$GithubIssueStateEnumMap, json['state']),
      title: json['title'] as String,
      description: json['body'] as String,
    );

Map<String, dynamic> _$GithubIssueDetailedDataToJson(
        GithubIssueDetailedData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'number': instance.number,
      'created_at': instance.creationDate.toIso8601String(),
      'user': instance.author,
      'labels': instance.labels,
      'state': _$GithubIssueStateEnumMap[instance.state],
      'body': instance.description,
    };

const _$GithubIssueStateEnumMap = {
  GithubIssueState.open: 'open',
  GithubIssueState.closed: 'closed',
};
