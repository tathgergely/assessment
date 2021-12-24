import 'package:flutter/material.dart';
import 'package:github_client/domain/entities/github_issue_state.dart';

class IssueStateImage extends StatelessWidget {
  const IssueStateImage({required this.state, Key? key}) : super(key: key);
  final GithubIssueState state;

  @override
  Widget build(BuildContext context) {
    return Image(
        height: 15,
        image: state == GithubIssueState.open
            ? const AssetImage('assets/open_issue.png')
            : const AssetImage('assets/closed_issue.png'));
  }
}
