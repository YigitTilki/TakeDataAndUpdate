import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

/// Adaptive view for all platforms
final class AdaptAllView extends StatelessWidget {
  /// Define custom widgets for all platforms
  const AdaptAllView(
      {super.key,
      required this.phone,
      required this.tablet,
      required this.desktop});

  final Widget phone;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isPhone) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;
    if (ResponsiveBreakpoints.of(context).isDesktop) return desktop;
    return desktop;
  }
}
