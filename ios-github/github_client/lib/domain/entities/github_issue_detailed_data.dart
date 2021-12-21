import 'package:github_client/domain/entities/github_issue_comment.dart';
import 'package:github_client/domain/entities/github_issue_data.dart';
import 'package:github_client/domain/entities/github_issue_state.dart';
import 'package:github_client/domain/entities/github_user_detailed_data.dart';
import 'package:github_client/domain/entities/label.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_issue_detailed_data.g.dart';

@JsonSerializable()
class GithubIssueDetailedData extends GithubIssueData {
  const GithubIssueDetailedData(
      {required GithubUserDetailedData author,
      required final int number,
      required final DateTime creationDate,
      required final List<Label> labels,
      required final GithubIssueState state,
      required final String title,
      required this.description})
      : super(
            author: author,
            labels: labels,
            number: number,
            state: state,
            title: title,
            creationDate: creationDate);
  final String description;

  factory GithubIssueDetailedData.fromJson(Map<String, dynamic> json) =>
      _$GithubIssueDetailedDataFromJson(json);
  Map<String, dynamic> toJson() => _$GithubIssueDetailedDataToJson(this);
}
