import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AlertBoxPage extends ConsumerStatefulWidget {
  const AlertBoxPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlertBoxPageState();
}

class _AlertBoxPageState extends ConsumerState<AlertBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
