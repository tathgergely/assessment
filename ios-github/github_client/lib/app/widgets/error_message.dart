import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final Object error;
  const ErrorMessageWidget({required this.error, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(error.toString()),
      ),
    );
  }
}
