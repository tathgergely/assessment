import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:github_client/app/pages/details_view/details_controller.dart';
import 'package:github_client/app/widgets/detailed_issue_card.dart';
import 'package:github_client/app/widgets/error_message.dart';
import 'package:github_client/app/widgets/issue_card.dart';
import 'package:github_client/app/widgets/loading_indicator.dart';
import 'package:github_client/data/constants.dart';
import 'package:github_client/data/repositories/github_repository.dart';
import 'package:github_client/domain/entities/github_issue_detailed_data.dart';

class DetailsView extends View {
  final int number;
  DetailsView({required this.number, Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DetailsState(number);
}

class DetailsState extends ResponsiveViewState<DetailsView, DetailsController> {
  DetailsState(int number)
      : super(DetailsController(GithubRepository.create(), number));

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();

  @override
  Widget get mobileView => Scaffold(
        appBar: AppBar(
          title: Text('Issue #${widget.number}'),
        ),
        body: ControlledWidgetBuilder<DetailsController>(
            builder: (context, controller) {
          return StreamBuilder<GithubIssueDetailedData>(
            stream: controller.issue,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ErrorMessageWidget(error: snapshot.error!);
              }
              if (snapshot.hasData) {
                return DetailedIssueCard(issue: snapshot.data!);
              }
              return const LoadingIndicator();
            },
          );
        }),
      );
}
