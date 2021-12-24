import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/app/pages/master_view/master_filter.dart';
import 'package:github_client/data/exceptions/empty_parameters_exception.dart';
import 'package:github_client/data/exceptions/fetch_data_exception.dart';
import 'package:github_client/data/repositories/github_repository.dart';
import 'package:github_client/domain/entities/github_issue_data.dart';

class GetGithubIssuesUseCase extends CompletableUseCase<GetGithubIssuesParams> {
  final GithubRepository _githubRepository;
  GetGithubIssuesUseCase(this._githubRepository);

  @override
  Future<Stream<GetGithubIssuesResponse>> buildUseCaseStream(
      GetGithubIssuesParams? params) async {
    final StreamController<GetGithubIssuesResponse> controller =
        StreamController();

    try {
      if (params == null) throw EmptyParametersException();
      final Response<List<GithubIssueData>> issuesResult =
          await _githubRepository.getIssues(
              page: params.page,
              pageSize: params.pageSize,
              state: params.filter.state.name);

      if (!issuesResult.isSuccessful) {
        throw FetchDataException(
            message:
                'Get issues failed. Status code: ${issuesResult.statusCode}');
      }
      controller.add(GetGithubIssuesResponse(issuesResult.body!));
      controller.close();
    } catch (e) {
      print(e);
      logger.severe('LoginUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetGithubIssuesParams {
  final int page, pageSize;
  final MasterFilter filter;
  GetGithubIssuesParams(this.page, this.pageSize, this.filter);
}

class GetGithubIssuesResponse {
  final List<GithubIssueData> issues;
  GetGithubIssuesResponse(this.issues);
}
