import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/app/pages/details_view/details_presenter.dart';
import 'package:github_client/domain/usecases/get_github_issue_usecase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:github_client/domain/entities/github_issue_detailed_data.dart';

class DetailsController extends Controller {
  final DetailsPresenter detailsPresenter;
  final int number;
  final _issue = BehaviorSubject<GithubIssueDetailedData>();
  Function(GithubIssueDetailedData) get _changeIssue => _issue.sink.add;
  Stream<GithubIssueDetailedData> get issue => _issue;
  DetailsController(githubRepository, this.number)
      : detailsPresenter = DetailsPresenter(githubRepository),
        super() {
    getIssue(number: number);
  }

  void getIssue({required int number}) {
    detailsPresenter.getIssue(number: number);
  }

  @override
  void initListeners() {
    detailsPresenter.getIssueOnNext = (GetGithubIssueResponse response) {
      print('Válasz: $response');
      _changeIssue(response.issue);
    };
    detailsPresenter.getIssueOnComplete = () {
      print('Successful request.');
    };
    detailsPresenter.getIssueOnError = (e) {
      print('Could not retrieve issues.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      refreshUI();
    };
  }

  @override
  void onDisposed() {
    detailsPresenter.dispose();
    super.onDisposed();
  }
}
