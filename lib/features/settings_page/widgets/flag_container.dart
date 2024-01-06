import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locales.dart';
import 'package:take_data_and_update_project/product/init/languages/product_localizations.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';
import 'package:take_data_and_update_project/product/widgets/scaffold_messengers.dart';

class FlagContainer extends StatelessWidget {
  const FlagContainer({
    required this.language,
    required this.image,
    required this.flagText,
    super.key,
  });
  final Locales language;
  final AssetGenImage image;
  final String flagText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ProductLocalizations.updateLanguage(
              context: context,
              value: language,
            );
            scaffoldMessenger(context, context.locale.toString());
          },
          child: Container(
            width: 100.w,
            height: 80.h,
            padding: ProjectPadding.allSmall(),
            decoration: Decorations.borderContainerDecoration(
              context.secondaryColor,
              context.fourthColor,
            ),
            child: Container(
              decoration: Decorations.circleWithBorderDecoration(
                context.fourthColor,
              ),
              child: image.image(),
            ),
          ),
        ),
        Text(
          flagText.tr(),
          style: context.bodyLarge,
        ),
      ],
    );
  }
}
