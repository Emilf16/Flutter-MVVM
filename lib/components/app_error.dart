import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errorText;
  const AppError({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: errorText.isNotEmpty,
        child: Text(
          errorText,
          style: TextStyle(color: Colors.red, fontSize: 18),
        ));
  }
}
