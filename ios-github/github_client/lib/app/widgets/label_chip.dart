import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:github_client/domain/entities/label.dart';

class LabelChip extends StatelessWidget {
  final Label label;
  const LabelChip({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: AutoSizeText(
        label.name,
        maxFontSize: 10,
        minFontSize: 5,
      ),
      backgroundColor: label.color,
    );
  }
}
