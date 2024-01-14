import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/splash/net_provider.dart';
import 'package:take_data_and_update_project/features/splash/splash_provider.dart';

final splashProvider =
    StateNotifierProvider<SplashProvider, SplashState>((ref) {
  return SplashProvider();
});

final connectivityProvider =
    StateNotifierProvider<ConnectionNotifier, ConnectionState>((ref) {
  return ConnectionNotifier();
});
