import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/features/splash/mixin.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashPage>
    with SplashViewListenMixin {
  @override
  Widget build(BuildContext context) {
    listenAndNavigate();

    return Scaffold(
      body: Center(
        child: Assets.lottie.splashCat.lottie(),
      ),
    );
  }
}
