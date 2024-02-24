import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/features/forgot_password/pages/enter_code_page.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

mixin EnterCodeMixin on State<EnterCodePage> {
  final TextEditingController codeController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
  }

  Future<void> elevatedButtonProcess() async {
    if (codeController.text != widget.code.toString()) {
      scaffoldMessenger(context, 'Hatalı kod');
    } else {
      await context.router.replace(ResetPasswordRoute(email: widget.email));
    }
  }
}
