import 'package:flutter/material.dart';

extension DialogExtension on BuildContext {
  void showSuccessDialog(String title, String description,
      [Function? callback]) {
    showDialog(
        context: this,
        builder: (ctx) => AlertDialog(
              title: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              content: Text(description),
              actions: <Widget>[
                TextButton(
                  child: const Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    callback?.call();
                  },
                ),
              ],
            ));
  }
}
