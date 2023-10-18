import 'package:flutter/material.dart';

Future<void> showInfo(
    BuildContext context, String title, String message) async {
  Text titleWidget =
      Text("❕ $title", style: const TextStyle(color: Colors.cyan));

  Text messageWidget = Text("$message!");

  ElevatedButton okButton = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade900),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        "OK!",
        style: TextStyle(color: Colors.white),
      ));

  return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: titleWidget,
            content: messageWidget,
            actions: [okButton],
          ));
}
