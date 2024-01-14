import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/auth/login_page/login_page.dart';

mixin LoginPageMixin on ConsumerState<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  bool hasInternet = false;

  @override
  void initState() {
    super.initState();
    wifiConnector(context);
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  final internetConnectionProvider = StateProvider<bool>((ref) => true);

  StreamSubscription<ConnectivityResult> wifiConnector(BuildContext context) {
    return Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      final internetConnection = ref.read(internetConnectionProvider.notifier);

      if (result == ConnectivityResult.none) {
        internetConnection.state = false;

        showDialog<Widget>(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('No Internet'),
            );
          },
        );
      } else {
        internetConnection.state = true;
      }
    });
  }
}
