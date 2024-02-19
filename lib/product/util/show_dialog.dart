import 'package:flutter/material.dart';

Future<dynamic> show(BuildContext context, Widget widget) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return widget;
    },
  );
}
