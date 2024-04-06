import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';

class MyRefreshIndicator extends ConsumerWidget {
  const MyRefreshIndicator({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(userDeviceListProvider);
      },
      child: child,
    );
  }
}
