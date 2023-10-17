import 'package:flutter/material.dart';

class CustomizedText extends StatelessWidget {
  final String text;

  const CustomizedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20),
    );
  }
}
