import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/init/languages/locales.dart';
import 'package:take_data_and_update_project/product/init/languages/product_localizations.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';

final flagProvider = StateProvider<bool>((ref) => false);

class LogoDividerView extends ConsumerWidget {
  const LogoDividerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEng = ref.watch(flagProvider.notifier).state;

    return CustomHeader(
      icon: Assets.icons.processor.image(),
      text: 'VTGRS',
      needBackButton: false,
      iconButton: IconButton(
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
                width: 30.w,
                height: 30.h,
              )
            : Assets.images.trFlag.image(
                width: 30.w,
                height: 30.h,
              ),
      ),
    );
  }
}
