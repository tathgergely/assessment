// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$GithubRepository extends GithubRepository {
  _$GithubRepository([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GithubRepository;

  @override
  Future<Response<GithubIssueDetailedData>> getIssue({required String number}) {
    final $url =
        'https://api.github.com/repos/Alamofire/Alamofire+/issues/${number}';
    final $headers = {
      'access_token': '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',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<GithubIssueDetailedData, GithubIssueDetailedData>($request);
  }

  @override
  Future<Response<List<GithubIssueData>>> getIssues(
      {required int page, required int pageSize}) {
    final $url =
        'https://api.github.com/repos/Alamofire/Alamofire+/issues/?per_page=${pageSize}&page=${page}';
    final $headers = {
      'access_token': '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',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<GithubIssueData>, GithubIssueData>($request);
  }

  @override
  Future<Response<bool>> isTokenValid() {
    final $url = 'https://api.github.com/user';
    final $headers = {
      'access_token': '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',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<bool, bool>($request);
  }
}
