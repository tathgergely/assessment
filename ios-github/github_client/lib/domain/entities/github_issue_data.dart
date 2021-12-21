import 'package:flutter/material.dart';
import 'package:github_client/domain/entities/github_issue_state.dart';
import 'package:github_client/domain/entities/github_user_data.dart';
import 'package:github_client/domain/entities/label.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_issue_data.g.dart';

@JsonSerializable()
class GithubIssueData {
  const GithubIssueData(
      {required this.title,
      required this.number,
      required this.creationDate,
      required this.author,
      required this.labels,
      required this.state});

  final String title;
  final int number;
  @JsonKey(name: 'created_at')
  final DateTime creationDate;
  @JsonKey(name: 'user')
  final GithubUserData author;
  final List<Label> labels;
  final GithubIssueState state;

  factory GithubIssueData.fromJson(Map<String, dynamic> json) =>
      _$GithubIssueDataFromJson(json);
  Map<String, dynamic> toJson() => _$GithubIssueDataToJson(this);
}
