// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_issue_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubIssueData _$GithubIssueDataFromJson(Map<String, dynamic> json) =>
    GithubIssueData(
      title: json['title'] as String,
      number: json['number'] as int,
      creationDate: DateTime.parse(json['created_at'] as String),
      author: GithubUserData.fromJson(json['user'] as Map<String, dynamic>),
      labels: (json['labels'] as List<dynamic>)
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: $enumDecode(_$GithubIssueStateEnumMap, json['state']),
    );

Map<String, dynamic> _$GithubIssueDataToJson(GithubIssueData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'number': instance.number,
      'created_at': instance.creationDate.toIso8601String(),
      'user': instance.author,
      'labels': instance.labels,
      'state': _$GithubIssueStateEnumMap[instance.state],
    };

const _$GithubIssueStateEnumMap = {
  GithubIssueState.open: 'open',
  GithubIssueState.closed: 'closed',
};
