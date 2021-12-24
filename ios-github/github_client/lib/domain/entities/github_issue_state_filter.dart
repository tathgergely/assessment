import 'package:json_annotation/json_annotation.dart';

enum GithubIssueStateFilter {
  @JsonValue('open')
  open,
  @JsonValue('closed')
  closed,
  @JsonValue('all')
  all
}
