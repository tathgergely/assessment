import 'package:github_client/domain/entities/github_issue_state.dart';
import 'package:github_client/domain/entities/github_user_data.dart';
import 'package:github_client/domain/entities/label.dart';

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
  final DateTime creationDate;
  final GithubUserData author;
  final List<Label> labels;
  final GithubIssueState state;
}
