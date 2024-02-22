import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/util/show_dialog.dart';
import 'package:take_data_and_update_project/product/widgets/pop_ups/no_wifi_pop_up.dart';

final internetConnectionProvider = StateProvider<bool>((ref) => true);

StreamSubscription<ConnectivityResult> wifiConnector(
  BuildContext context,
  WidgetRef ref,
) {
  return Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) {
    final internetConnection = ref.read(internetConnectionProvider.notifier);

    if (result == ConnectivityResult.none) {
      internetConnection.state = false;

      show(
        context,
        NoWifiPopUp(
          navigator: () {
            context.router.popForced();
          },
        ),
        barrierDismissible: false,
      );
    } else {
      internetConnection.state = true;
    }
  });
}
