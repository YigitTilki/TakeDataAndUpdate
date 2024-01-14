// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionNotifier extends StateNotifier<ConnectionState> {
  ConnectionNotifier() : super(const ConnectionState());

  StreamSubscription<ConnectivityResult> wifiConnector(BuildContext context) {
    return Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      //final internetConnection = ref.read(internetConnectionProvider.notifier);

      if (result == ConnectivityResult.none) {
        state = state.copyWith(isConnected: false);
        //internetConnection.state = false;
      } else {
        state = state.copyWith(isConnected: true);
        // internetConnection.state = true;
      }
    });
  }
}

class ConnectionState extends Equatable {
  const ConnectionState({this.isConnected});

  final bool? isConnected;
  @override
  List<Object?> get props => [isConnected];

  ConnectionState copyWith({
    bool? isConnected,
  }) {
    return ConnectionState(
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
