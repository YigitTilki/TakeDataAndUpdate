import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locales.dart';
import 'package:take_data_and_update_project/product/init/languages/product_localizations.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/text/header_text.dart';

final flagProvider = StateProvider<bool>((ref) => false);

class AuthHeader extends ConsumerWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 40;
    final isEng = ref.watch(flagProvider.notifier).state;

    return Padding(
      padding: ProjectPadding.allNormal(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: iconSize.w,
              ),
              const HeaderText(value: 'VTGRS'),
              _flagButton(context, ref, isEng, iconSize),
            ],
          ),
          AppSpacer.vertical.space10,
          const _Divider(),
        ],
      ),
    );
  }

  IconButton _flagButton(
    BuildContext context,
    WidgetRef ref,
    bool isEng,
    int iconSize,
  ) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (context.locale == const Locale('tr', 'TR')) {
          ProductLocalizations.updateLanguage(
            context: context,
            value: Locales.en,
          );
          ref.read(flagProvider.notifier).state = true;
        } else {
          ProductLocalizations.updateLanguage(
            context: context,
            value: Locales.tr,
          );
          ref.read(flagProvider.notifier).state = false;
        }
      },
      icon: isEng
          ? Assets.images.ukFlag.image(
              width: iconSize.w,
              height: iconSize.h,
            )
          : Assets.images.trFlag.image(
              width: iconSize.w,
              height: iconSize.h,
            ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 10,
      endIndent: 10,
      thickness: 3.sp,
      color: context.fourthColor,
    );
  }
}
