import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

class BorderedElevatedButton extends StatelessWidget {
  const BorderedElevatedButton({
    required this.onPressed,
    required this.text,
    super.key,
  });
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom().copyWith(
        side: MaterialStatePropertyAll(
          BorderSide(width: 2, color: context.fourthColor),
        ),
      ),
      child: Text(
        text.tr(),
        style: context.titleMedium,
      ),
    );
  }
}
