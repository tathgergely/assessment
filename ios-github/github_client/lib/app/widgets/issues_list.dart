import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/app/pages/master_view/master_controller.dart';
import 'package:github_client/app/pages/master_view/master_filter.dart';
import 'package:github_client/app/widgets/issue_card.dart';
import 'package:github_client/app/widgets/loading_indicator.dart';
import 'package:github_client/app/widgets/loading_list_view.dart';
import 'package:github_client/data/constants.dart';
import 'package:github_client/domain/entities/github_issue_data.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class IssuesListView extends StatefulWidget {
  final MasterController controller;
  MasterFilter filter;
  IssuesListView(
      {required this.filter, required BuildContext parentContext, Key? key})
      : controller = FlutterCleanArchitecture.getController<MasterController>(
            parentContext),
        super(key: key);
  @override
  _IssuesListViewState createState() => _IssuesListViewState();
}

class _IssuesListViewState extends State<IssuesListView> {
  final PagingController<int, GithubIssueData> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    widget.controller.filter.listen((newFilter) {
      setState(() {
        _update(newFilter);
      });
    });
    _pagingController.addPageRequestListener((pageKey) {
      widget.controller.page = pageKey;
      _fetchPage();
    });
    super.initState();
  }

  void _update(MasterFilter newFilter) {
    widget.filter = newFilter;
    _pagingController.itemList = List.empty();
  }

  Future<void> _fetchPage() async {
    try {
      List<GithubIssueData> newItems = List.empty();
      widget.controller.getIssues(
          page: widget.controller.page, pageSize: widget.controller.pageSize);
      widget.controller.issues.listen((event) {
        newItems = event;
        print('New item read');
        final isLastPage = newItems.length < widget.controller.pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final int nextPageKey = widget.controller.page + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      });
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, GithubIssueData>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<GithubIssueData>(
          itemBuilder: (context, item, index) => IssueCard(
                issue: item,
              ),
          newPageProgressIndicatorBuilder: (context) => LoadingIndicator()));

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
