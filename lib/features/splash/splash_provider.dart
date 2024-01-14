import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/enums/platform_enum.dart';
import 'package:take_data_and_update_project/product/models/number_model.dart';
import 'package:take_data_and_update_project/product/util/version_manager.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      state = state.copyWith(isConnected: false);
      return;
    } else {
      state = state.copyWith(isConnected: true);
      state = state.copyWith(isRedirectHome: true);

      return;
    }
  }

  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();

    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRedirectHome: false);
      return;
    }

    final checkIsNeedForceUpdate = VersionManager(
      deviceValue: clientVersion,
      databaseValue: databaseValue,
    );

    if (checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    state = state.copyWith(isRedirectHome: true);
  }

  Future<String?> getVersionNumberFromDatabase() async {
    if (kIsWeb) return null;

    final response = await FirebaseCollections.version.reference
        .withConverter<NumberModel>(
          fromFirestore: (snapshot, options) =>
              NumberModel().fromFirebase(snapshot),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(PlatformEnum.versionName)
        .get();

    return response.data()?.number;
  }
}

class SplashState extends Equatable {
  const SplashState({
    this.isRequiredForceUpdate,
    this.isRedirectHome,
    this.isConnected,
  });

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;
  final bool? isConnected;

  @override
  List<Object?> get props =>
      [isRequiredForceUpdate, isRedirectHome, isConnected];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
    bool? isConnected,
  }) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
