import 'dart:async';

import 'package:github_client/domain/repositories/i_get_github_issue.dart';
import 'package:github_client/domain/repositories/i_get_github_issues.dart';

abstract class GithubRepository implements IGetGithubIssue, IGetGithubIssues {
  GithubRepository(this.token) {
    _init();
  }
  GithubRepository.late();
  void _init() async {
    if (await validateToken(token)) {
      isConfigured = true;
    }
  }

  void configure(String token) {
    this.token = token;
    _init();
  }

  late String token = '';
  bool isConfigured = false;

  Future<bool> validateToken(String token);
}
