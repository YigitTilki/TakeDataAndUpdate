import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:take_data_and_update_project/features/auth/register_page/verify_email_page.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/service/auth_repository.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin VerifyEmailMixin on ConsumerState<VerifyEmailPage> {
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    wifiConnector(context, ref);
  }

  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    try {
      if (!context.mounted) {
        return;
      }

      if (codeController.text != widget.code.toString()) {
        scaffoldMessenger(
          context,
          LocaleKeys.forgotPassword_invalidCode,
        );
      } else {
        await AuthRepository()
            .singUpUser(userModel: widget.userModel, context: context);
        if (!context.mounted) return;

        await context.router.replace(HomeRoute(userModel: widget.userModel));
      }
    } catch (e) {
      Logger().d('Error in elevatedButtonProcess: $e');
    }
  }
}
