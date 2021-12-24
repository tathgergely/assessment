import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/data/exceptions/empty_parameters_exception.dart';
import 'package:github_client/data/exceptions/fetch_data_exception.dart';
import 'package:github_client/data/repositories/github_repository.dart';
import 'package:github_client/domain/entities/github_issue_detailed_data.dart';

class GetGithubIssueUseCase extends CompletableUseCase<GetGithubIssueParams> {
  final GithubRepository _githubRepository;
  GetGithubIssueUseCase(this._githubRepository);

  @override
  Future<Stream<GetGithubIssueResponse>> buildUseCaseStream(
      GetGithubIssueParams? params) async {
    final StreamController<GetGithubIssueResponse> controller =
        StreamController();

    try {
      if (params == null) throw EmptyParametersException();
      final Response<GithubIssueDetailedData> issuesResult =
          await _githubRepository.getIssue(number: params.number);

      if (!issuesResult.isSuccessful) {
        throw FetchDataException(
            message:
                'Get issues failed. Status code: ${issuesResult.statusCode}');
      }
      controller.add(GetGithubIssueResponse(issuesResult.body!));
      controller.close();
    } catch (e) {
      print(e);
      logger.severe('LoginUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetGithubIssueParams {
  final int number;
  GetGithubIssueParams(this.number);
}

class GetGithubIssueResponse {
  final GithubIssueDetailedData issue;
  GetGithubIssueResponse(this.issue);
}
