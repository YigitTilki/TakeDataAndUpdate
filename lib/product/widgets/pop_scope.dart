import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/exit_pop_up.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/go_login_page.dart';

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

class GoLoginPopScope extends StatelessWidget {
  const GoLoginPopScope({required this.child, super.key});
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
        show(context, const GoLoginPagePopUp());
      },
    );
  }
}
