import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:take_data_and_update_project/features/splash/splash_provider.dart';
import 'package:take_data_and_update_project/product/init/route/app_router.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashPage>
    with _SplashViewListenMixin {
  final splashProvider =
      StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    super.initState();

    ref.read(splashProvider.notifier).checkApplicationVersion(''.ext.version);
  }

  @override
  Widget build(BuildContext context) {
    listenAndNavigate(splashProvider);

    return Scaffold(
      body: Center(
        child: Assets.lottie.splashCat.lottie(),
      ),
    );
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashPage> {
  void listenAndNavigate(
    StateNotifierProvider<SplashProvider, SplashState> provider,
  ) {
    ref.listen(provider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        if (next.isRedirectHome!) {
          context.router.replace(const LoginRoute());
        } else {}
      }
    });
  }
}
