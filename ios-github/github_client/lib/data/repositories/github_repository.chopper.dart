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
  Future<Response<GithubIssueDetailedData>> getIssue({required int number}) {
    final $url =
        'https://api.github.com/repos/Alamofire/Alamofire/issues/${number}';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<GithubIssueDetailedData, GithubIssueDetailedData>($request);
  }

  @override
  Future<Response<List<GithubIssueData>>> getIssues(
      {required int page, required int pageSize, required String state}) {
    final $url =
        'https://api.github.com/repos/Alamofire/Alamofire/issues?state=${state}&per_page=${pageSize}&page=${page}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<GithubIssueData>, GithubIssueData>($request);
  }

  @override
  Future<Response<bool>> isTokenValid() {
    final $url = 'https://api.github.com/user';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<bool, bool>($request);
  }
}
