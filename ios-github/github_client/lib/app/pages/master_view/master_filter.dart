import 'package:github_client/domain/entities/github_issue_state_filter.dart';

class MasterFilter {
  GithubIssueStateFilter state;
  MasterFilter(this.state);
  MasterFilter.init() : state = GithubIssueStateFilter.all;
  bool isEqualTo(MasterFilter filter2) {
    if (state == filter2.state) {
      return true;
    } else {
      return false;
    }
  }
}
