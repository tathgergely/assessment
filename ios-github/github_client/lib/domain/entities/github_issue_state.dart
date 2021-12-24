import 'package:json_annotation/json_annotation.dart';

enum GithubIssueState {
  @JsonValue('open')
  open,
  @JsonValue('closed')
  closed
}
