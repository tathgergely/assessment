// ignore_for_file: require_trailing_commas

import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:github_client/data/constants.dart';
import 'package:github_client/domain/entities/github_issue_data.dart';
import 'package:github_client/domain/entities/github_issue_detailed_data.dart';
import 'package:github_client/domain/repositories/i_get_github_issue.dart';
import 'package:github_client/domain/repositories/i_get_github_issues.dart';

part 'github_repository.chopper.dart';

@ChopperApi(baseUrl: kGithubBaseURL)
abstract class GithubRepository extends ChopperService
    implements IGetGithubIssue, IGetGithubIssues {
  @Get(
      path: '$kAlamofireRepositoryEndpoint+/issues/{number}',
      headers: {'access_token': kGithubToken})
  @override
  Future<Response<GithubIssueDetailedData>> getIssue(
      {@Path('number') required String number});

  @Get(
      path:
          '$kAlamofireRepositoryEndpoint+/issues/?per_page={pageSize}&page={page}',
      headers: {'access_token': kGithubToken})
  @override
  Future<Response<List<GithubIssueData>>> getIssues(
      {@Path('page') required int page,
      @Path('pageSize') required int pageSize});

  @Get(path: '/user', headers: {'access_token': kGithubToken})
  Future<Response<bool>> isTokenValid();
}
