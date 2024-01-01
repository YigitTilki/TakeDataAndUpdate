import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/app_widget.dart';
import 'package:take_data_and_update_project/init/application_init.dart';
import 'package:take_data_and_update_project/init/languages/product_localizations.dart';

void main() async {
  await ApplicationInitialize().make();
  runApp(
    ProviderScope(
      child: ProductLocalizations(
        child: AppWidget(),
      ),
    ),
  );
}
