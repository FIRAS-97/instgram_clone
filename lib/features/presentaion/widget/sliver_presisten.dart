import 'package:flutter/cupertino.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class SliverPresisten implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final Widget child;

  SliverPresisten(
      {required this.minExtent, required this.maxExtent, required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw UnimplementedError();
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      throw UnimplementedError();

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      throw UnimplementedError();

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
      throw UnimplementedError();

  @override
  TickerProvider? get vsync => throw UnimplementedError();
}
