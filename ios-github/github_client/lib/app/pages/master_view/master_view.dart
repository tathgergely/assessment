import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/app/pages/master_view/master_controller.dart';
import 'package:github_client/app/pages/master_view/master_filter.dart';
import 'package:github_client/app/widgets/issue_card.dart';
import 'package:github_client/app/widgets/issues_list.dart';
import 'package:github_client/app/widgets/loading_indicator.dart';
import 'package:github_client/app/widgets/loading_list_view.dart';
import 'package:github_client/data/constants.dart';
import 'package:github_client/data/repositories/github_repository.dart';
import 'package:github_client/domain/entities/github_issue_data.dart';
import 'package:github_client/domain/entities/github_issue_state.dart';
import 'package:github_client/domain/entities/github_issue_state_filter.dart';

class MasterView extends View {
  @override
  State<StatefulWidget> createState() => MasterState();
}

class MasterState extends ViewState<MasterView, MasterController> {
  MasterState() : super(MasterController(GithubRepository.create()));

  @override
  Widget get view {
    return ControlledWidgetBuilder<MasterController>(
        builder: (context, controller) {
      return MaterialApp(
          title: kAppTitle,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                actions: [
                  GestureDetector(
                    onTap: () async {
                      await showDialog<GithubIssueStateFilter>(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: const Text('Select assignment'),
                              children: <Widget>[
                                SimpleDialogOption(
                                  onPressed: () {
                                    Navigator.pop(
                                        context, GithubIssueStateFilter.open);
                                  },
                                  child: const Text('Open'),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    Navigator.pop(
                                        context, GithubIssueStateFilter.closed);
                                  },
                                  child: const Text('Closed'),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    Navigator.pop(
                                        context, GithubIssueStateFilter.all);
                                  },
                                  child: const Text('All'),
                                ),
                              ],
                            );
                          }).then((filteredState) {
                        if (filteredState != null) {
                          controller.updateFilterState(filteredState);
                        }
                      });
                    },
                    child: const Icon(
                      Icons.filter_alt,
                      size: 26.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: StreamBuilder<MasterFilter>(
                      initialData: MasterFilter.init(),
                      stream: controller.filter,
                      builder: (context, snapshot) {
                        return _showFilterState(state: snapshot.data!.state);
                      },
                    ),
                  ),
                ],
                title: const Text('Main Page'),
              ),
              body: StreamBuilder<MasterFilter>(
                initialData: MasterFilter.init(),
                stream: controller.filter,
                builder: (context, snapshot) {
                  return IssuesListView(
                      parentContext: context, filter: snapshot.data!);
                },
              )));
    });
  }
}

class _showFilterState extends StatelessWidget {
  const _showFilterState({required this.state, Key? key}) : super(key: key);

  final GithubIssueStateFilter state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case GithubIssueStateFilter.open:
        return const Text('O');
      case GithubIssueStateFilter.closed:
        return const Text('C');
      case GithubIssueStateFilter.all:
        return Container();
      default:
        return Container();
    }
  }
}
