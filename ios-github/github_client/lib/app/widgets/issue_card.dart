import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:github_client/app/pages/details_view/details_view.dart';
import 'package:github_client/app/utils/date_time_converter.dart';
import 'package:github_client/app/widgets/issue_state_image.dart';
import 'package:github_client/domain/entities/github_issue_data.dart';

class IssueCard extends StatelessWidget {
  const IssueCard({required this.issue, Key? key}) : super(key: key);
  final GithubIssueData issue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsView(number: issue.number),
            fullscreenDialog: true)),
        child: Card(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: IssueStateImage(state: issue.state),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: AutoSizeText(
                        issue.title,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text('#${issue.number}'),
                  Text(' opened${issue.creationDate.recentDate()}'),
                  Text(' by ${issue.author.loginName}')
                ],
              )
            ],
          ),
        ));
  }
}
