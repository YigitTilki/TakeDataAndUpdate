import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

class MediumText extends StatelessWidget {
  const MediumText({required this.value, super.key});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value.tr(),
      style: context.headlineSmall,
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
    );
  }
}
