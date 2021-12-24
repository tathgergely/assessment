import 'package:flutter/material.dart';
import 'package:github_client/domain/entities/github_issue_state.dart';

class IssueStateChip extends StatelessWidget {
  const IssueStateChip({required this.state, Key? key}) : super(key: key);
  final GithubIssueState state;

  @override
  Widget build(BuildContext context) {
    return state == GithubIssueState.open
        ? const Chip(
            label: Text(
              'open',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          )
        : const Chip(
            label: Text('closed', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          );
  }
}
