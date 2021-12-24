import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/app/pages/master_view/master_filter.dart';
import 'package:github_client/data/exceptions/fetch_data_exception.dart';
import 'package:github_client/domain/usecases/get_github_issues_usecase.dart';

class MasterPresenter extends Presenter {
  late Function(GetGithubIssuesResponse) getIssuesOnNext;
  late Function getIssuesOnComplete;
  late Function(FetchDataException) getIssuesOnError;

  MasterPresenter(githubRepository)
      : _getGithubIssuesUseCase = GetGithubIssuesUseCase(githubRepository);
  final GetGithubIssuesUseCase _getGithubIssuesUseCase;

  void getIssues(
      {required int page,
      required int pageSize,
      required MasterFilter filter}) {
    _getGithubIssuesUseCase.execute(_GetGithubIssuesUseCaseObserver(this),
        GetGithubIssuesParams(page, pageSize, filter));
  }

  @override
  void dispose() {
    _getGithubIssuesUseCase.dispose();
  }
}

class _GetGithubIssuesUseCaseObserver
    implements Observer<GetGithubIssuesResponse> {
  final MasterPresenter masterPresenter;

  _GetGithubIssuesUseCaseObserver(this.masterPresenter);

  @override
  void onNext(response) {
    masterPresenter.getIssuesOnNext(response!);
  }

  @override
  void onComplete() {
    masterPresenter.getIssuesOnComplete;
  }

  @override
  void onError(e) {
    masterPresenter.getIssuesOnError(e);
  }
}
