import 'dart:async';

import 'package:github_client/domain/repositories/i_get_github_issue.dart';
import 'package:github_client/domain/repositories/i_get_github_issues.dart';

abstract class GithubRepository implements IGetGithubIssue, IGetGithubIssues {
  GithubRepository(this.token) {
    _init();
  }

  void _init() async {
    if (await validateToken(token)) {
      isConfigured = true;
    }
  }

  final String token;
  bool isConfigured = false;

  Future<bool> validateToken(String token);
}
