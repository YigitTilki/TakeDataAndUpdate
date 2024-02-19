import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/exit_pop_up.dart';

class MyPopScope extends StatelessWidget {
  const MyPopScope({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: child,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        show(context, const ExitAppPopUp());
      },
    );
  }
}
