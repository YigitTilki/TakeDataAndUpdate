import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/forgot_password/pages/enter_code_page/enter_code_page.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/util/wifi_connector.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin EnterCodeMixin on ConsumerState<EnterCodePage> {
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
    if (codeController.text != widget.code.toString()) {
      scaffoldMessenger(
        context,
        LocaleKeys.forgotPassword_invalidCode,
      );
    } else {
      await context.router.replace(ResetPasswordRoute(email: widget.email));
    }
  }
}
