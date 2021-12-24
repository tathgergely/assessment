import 'package:flutter/material.dart';
import 'package:github_client/app/widgets/label_chip.dart';
import 'package:github_client/domain/entities/label.dart';

class LabelsList extends StatelessWidget {
  final List<Label> labels;
  const LabelsList({required this.labels, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.centerLeft,
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: labels.length,
            itemBuilder: (context, index) => LabelChip(label: labels[index])));
  }
}
