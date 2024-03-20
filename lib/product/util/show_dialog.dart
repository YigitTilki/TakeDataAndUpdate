import 'package:flutter/material.dart';

Future<dynamic> show(
  BuildContext context,
  Widget widget, {
  bool barrierDismissible = true,
}) {
  return showDialog<void>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return widget;
    },
  );
}
