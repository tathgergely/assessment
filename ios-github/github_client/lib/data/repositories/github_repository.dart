// ignore_for_file: require_trailing_commas

import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/animation.dart';
import 'package:github_client/data/constants.dart';
import 'package:github_client/data/converters/json_to_type_converter.dart';
import 'package:github_client/domain/entities/github_issue_data.dart';
import 'package:github_client/domain/entities/github_issue_detailed_data.dart';
import 'package:github_client/domain/entities/github_issue_state_filter.dart';
import 'package:github_client/domain/repositories/i_get_github_issue.dart';
import 'package:github_client/domain/repositories/i_get_github_issues.dart';

part 'github_repository.chopper.dart';

@ChopperApi(baseUrl: kGithubBaseURL)
abstract class GithubRepository extends ChopperService
    implements IGetGithubIssue, IGetGithubIssues {
  @Get(path: kAlamofireRepositoryEndpoint + '/issues/{number}')
  @override
  Future<Response<GithubIssueDetailedData>> getIssue(
      {@Path('number') required int number});

  @Get(
      path: kAlamofireRepositoryEndpoint +
          '/issues?state={state}&per_page={pageSize}&page={page}')
  @override
  Future<Response<List<GithubIssueData>>> getIssues(
      {@Path('page') required int page,
      @Path('pageSize') required int pageSize,
      @Path('state') required String state});

  @Get(path: '/user')
  Future<Response<bool>> isTokenValid();

  static GithubRepository create() {
    final client = ChopperClient(
        baseUrl: kGithubBaseURL,
        services: [_$GithubRepository()],
        converter: JsonToTypeConverter({
          GithubIssueDetailedData: (jsonData) =>
              GithubIssueDetailedData.fromJson(jsonData),
          GithubIssueData: (jsonData) => GithubIssueData.fromJson(jsonData)
        }),
        interceptors: [
          CurlInterceptor(),
          const HeadersInterceptor({'authorization': 'token $kGithubToken'}),
          HttpLoggingInterceptor()
        ]);
    return _$GithubRepository(client);
  }
}
