import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/data/exceptions/fetch_data_exception.dart';
import 'package:github_client/domain/usecases/get_github_issue_usecase.dart';

class DetailsPresenter extends Presenter {
  late Function(GetGithubIssueResponse) getIssueOnNext;
  late Function getIssueOnComplete;
  late Function(FetchDataException) getIssueOnError;

  DetailsPresenter(githubRepository)
      : _getGithubIssueUseCase = GetGithubIssueUseCase(githubRepository);
  final GetGithubIssueUseCase _getGithubIssueUseCase;

  void getIssue({required int number}) {
    _getGithubIssueUseCase.execute(
        _GetGithubIssueUseCaseObserver(this), GetGithubIssueParams(number));
  }

  @override
  void dispose() {
    _getGithubIssueUseCase.dispose();
  }
}

class _GetGithubIssueUseCaseObserver
    implements Observer<GetGithubIssueResponse> {
  final DetailsPresenter detailsPresenter;

  _GetGithubIssueUseCaseObserver(this.detailsPresenter);

  @override
  void onNext(response) {
    detailsPresenter.getIssueOnNext(response!);
  }

  @override
  void onComplete() {
    detailsPresenter.getIssueOnComplete;
  }

  @override
  void onError(e) {
    detailsPresenter.getIssueOnError(e);
  }
}
