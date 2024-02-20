// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:take_data_and_update_project/product/enums/firebase_enums.dart';
import 'package:take_data_and_update_project/product/enums/platform_enum.dart';
import 'package:take_data_and_update_project/product/models/number_model.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/util/version_manager.dart';

final splashProvider =
    StateNotifierProvider<SplashProvider, SplashState>((ref) {
  return SplashProvider();
});

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  /* Future<void> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      state = state.copyWith(isConnected: false);
      return;
    } else {
      state = state.copyWith(isConnected: true);
      state = state.copyWith(isRedirectHome: true);

      return;
    }
  } */
  Future<void> saveRememberMe({
    bool value = false,
    UserModel? userModel,
  }) async {
    if (userModel != null) {
      //TODO: checkbox basıksa kapanınca direkt home page atıyro düzelt
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('rememberMe', value);
      final userModelJson = jsonEncode(userModel.toMap());
      await prefs.setString('userModel', userModelJson);
    }
  }

  Future<void> checkRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    final rememberMeValue = prefs.getBool('rememberMe') ?? false;
    state = state.copyWith(rememberMe: rememberMeValue);
    final userModelJson = prefs.getString('userModel');

    if (userModelJson == null) return;
    final userModelMap = jsonDecode(userModelJson) as Map<String, dynamic>;
    state = state.copyWith(userModel: UserModel.fromJson(userModelMap));
    return;
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
    this.userModel,
    this.rememberMe,
    this.isRequiredForceUpdate,
    this.isRedirectHome,
    this.isConnected,
  });

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;
  final bool? isConnected;
  final bool? rememberMe;
  final UserModel? userModel;

  @override
  List<Object?> get props {
    return [
      isRequiredForceUpdate,
      isRedirectHome,
      isConnected,
      rememberMe,
      userModel,
    ];
  }

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
    bool? isConnected,
    bool? rememberMe,
    UserModel? userModel,
  }) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
      isConnected: isConnected ?? this.isConnected,
      rememberMe: rememberMe ?? this.rememberMe,
      userModel: userModel ?? this.userModel,
    );
  }
}
