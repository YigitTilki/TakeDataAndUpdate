import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class AdaptMobileView extends StatelessWidget {
  const AdaptMobileView({super.key, required this.phone, required this.tablet});

  final Widget phone;
  final Widget tablet;
  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isPhone) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;
    return tablet;
  }
}
