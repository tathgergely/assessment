import 'package:github_client/domain/entities/github_issue_data.dart';
import 'package:github_client/domain/entities/github_issue_detailed_data.dart';
import 'package:github_client/domain/repositories/github_repository.dart';

class DataGithubRepository extends GithubRepository {
  DataGithubRepository(String token) : super(token);
  DataGithubRepository.late() : super.late();
  @override
  Future<GithubIssueDetailedData> getIssue({required String id}) {
    // TODO: implement getIssue
    throw UnimplementedError();
  }

  @override
  Future<List<GithubIssueData>> getIssues(
      {required int page, required int pageSize}) {
    // TODO: implement getIssues
    throw UnimplementedError();
  }

  @override
  Future<bool> validateToken(String token) {
    // TODO: implement validateToken
    throw UnimplementedError();
  }
}
