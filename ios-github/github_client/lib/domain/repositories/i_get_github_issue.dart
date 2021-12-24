// ignore_for_file: one_member_abstracts

import 'package:chopper/chopper.dart';
import 'package:github_client/domain/entities/github_issue_detailed_data.dart';

abstract class IGetGithubIssue {
  Future<Response<GithubIssueDetailedData>> getIssue({required int number});
}
