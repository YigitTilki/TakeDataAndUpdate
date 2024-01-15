/* import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final internetConnectionProvider = StateProvider<bool>((ref) => true);

StreamSubscription<ConnectivityResult> wifiConnector(
//TODO: add wifiControl to all pages

  BuildContext context,
  WidgetRef ref,
) {
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
 */