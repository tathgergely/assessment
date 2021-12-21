// ignore_for_file: one_member_abstracts

import 'package:github_client/domain/entities/github_issue_data.dart';

abstract class IGetGithubIssues {
  Future<List<GithubIssueData>> getIssues(
      {required int page, required int pageSize});
}
