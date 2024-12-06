import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong'));
  }
}