import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final VoidCallback? function;
  final String title;

  const CustomizedButton(
      {super.key, this.function, this.title = "Has no name"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: FilledButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
          onPressed: function,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
