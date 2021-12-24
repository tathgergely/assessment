import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/app/pages/master_view/master_filter.dart';
import 'package:github_client/app/pages/master_view/master_presenter.dart';
import 'package:github_client/data/constants.dart';
import 'package:github_client/domain/entities/github_issue_state_filter.dart';
import 'package:github_client/domain/usecases/get_github_issues_usecase.dart';
import 'package:github_client/domain/entities/github_issue_data.dart';
import 'package:rxdart/rxdart.dart';

class MasterController extends Controller {
  final BehaviorSubject<MasterFilter> _filter = BehaviorSubject<MasterFilter>();
  Stream<MasterFilter> get filter => _filter.stream;
  Function(MasterFilter) get changeFilter => _filter.sink.add;

  int page;
  int pageSize;
  final MasterPresenter masterPresenter;
  final _issues = BehaviorSubject<List<GithubIssueData>>();
  Function(List<GithubIssueData>) get _changeIssues => _issues.sink.add;
  Stream<List<GithubIssueData>> get issues => _issues;
  MasterController(githubRepository)
      : masterPresenter = MasterPresenter(githubRepository),
        page = 0,
        pageSize = kPageSize {
    changeFilter(MasterFilter.init());
  }

  void updateFilterState(GithubIssueStateFilter newState) {
    if (_filter.stream.hasValue) {
      MasterFilter currentFilter = _filter.stream.value!;
      if (currentFilter.state != newState) {
        print(newState);
        currentFilter.state = newState;
        changeFilter(currentFilter);
        page = 0;
      }
    } else {
      changeFilter(MasterFilter(newState));
    }
    page = 0;
    pageSize = kPageSize;
    getIssues(page: page, pageSize: pageSize);
    refreshUI();
  }

  void getIssues({required int page, required int pageSize}) {
    MasterFilter filter;
    if (_filter.stream.hasValue) {
      filter = _filter.stream.value!;
    } else {
      filter = MasterFilter.init();
    }
    masterPresenter.getIssues(page: page, pageSize: pageSize, filter: filter);
  }

  @override
  void initListeners() {
    masterPresenter.getIssuesOnNext = (GetGithubIssuesResponse response) {
      print('Válasz: $response');
      _changeIssues(response.issues);
    };
    masterPresenter.getIssuesOnComplete = () {
      print('Successful request.');
    };
    masterPresenter.getIssuesOnError = (e) {
      print('Could not retrieve issues.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      refreshUI();
    };
  }

  @override
  void onDisposed() {
    masterPresenter.dispose();
    super.onDisposed();
  }
}
