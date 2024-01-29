// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/init/languages/locales.dart';
import 'package:take_data_and_update_project/product/init/languages/product_localizations.dart';

final changeFlagProvider =
    StateNotifierProvider<ChangeFlagNotifier, FlagState>((ref) {
  return ChangeFlagNotifier();
});

class ChangeFlagNotifier extends StateNotifier<FlagState> {
  ChangeFlagNotifier() : super(const FlagState());

  void toggleLanguage(BuildContext context) {
    final eng = ProductLocalizations.updateLanguage(
      context: context,
      value: Locales.en,
    );
    final tr = ProductLocalizations.updateLanguage(
      context: context,
      value: Locales.tr,
    );
    final currentLocale = EasyLocalization.of(context)!.locale;
    if (currentLocale == const Locale('en', 'US')) {
      state = state.copyWith(defaultLocale: tr);
    } else {
      state = state.copyWith(defaultLocale: eng);
    }
  }
}

class FlagState extends Equatable {
  const FlagState({this.defaultLocale});

  final Future<void>? defaultLocale;

  @override
  List<Object?> get props => [defaultLocale];

  FlagState copyWith({
    Future<void>? defaultLocale,
  }) {
    return FlagState(
      defaultLocale: defaultLocale ?? this.defaultLocale,
    );
  }
}
