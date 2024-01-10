import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

class SmallInfoText extends StatelessWidget {
  const SmallInfoText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      style: context.titleLarge?.copyWith(color: context.tertiaryColor),
    );
  }
}
