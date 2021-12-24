import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:github_client/app/utils/date_time_converter.dart';
import 'package:github_client/app/widgets/issue_state_chip.dart';
import 'package:github_client/domain/entities/github_issue_detailed_data.dart';
import 'package:github_client/domain/entities/github_issue_state.dart';
import 'package:marquee/marquee.dart';

class DetailedIssueCard extends StatelessWidget {
  const DetailedIssueCard({required this.issue, Key? key}) : super(key: key);
  final GithubIssueDetailedData issue;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            AutoSizeText(
              issue.title,
              maxLines: 2,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              minFontSize: 10,
              overflow: TextOverflow.ellipsis,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IssueStateChip(state: issue.state),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      issue.author.avatar,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Wrap(
                      children: [
                        Text(
                          issue.author.loginName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            ' opened this issue ${issue.creationDate.recentDate()}'),
                      ],
                    )),
              ],
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Scrollbar(
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            issue.description,
                          ),
                        ))))
          ],
        ),
      ),
    );
  }
}
