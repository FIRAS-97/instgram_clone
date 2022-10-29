import 'package:flutter/cupertino.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget MobileScreen;
  final Widget WebScreen;

  const ResponsiveScreen({
    Key? key,
    required this.MobileScreen,
    required this.WebScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const webScreenSize = 600;
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return WebScreen;
        }
        return MobileScreen;
      }),
    );
  }
}
