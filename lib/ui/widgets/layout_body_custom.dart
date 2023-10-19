import 'package:flutter/material.dart';

import '../utils/constants.dart';

extension LayoutDimensionsWidth on double {
  LayoutDimensions dimensions() {
    if (this < kIsMobile) {
      return LayoutDimensions.mobile;
    }

    if (this < kIsTablet) {
      return LayoutDimensions.tablet;
    }

    return LayoutDimensions.desktop;
  }
}

enum LayoutDimensions {
  mobile,
  tablet,
  desktop,
}

class LayoutBodyCustom extends StatefulWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget desktop;
  final VoidCallback refresh;

  const LayoutBodyCustom({super.key, this.mobile, this.tablet, required this.desktop, required this.refresh});

  @override
  State<LayoutBodyCustom> createState() => _LayoutBodyCustomState();
}

class _LayoutBodyCustomState extends State<LayoutBodyCustom> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth.dimensions() == LayoutDimensions.mobile && widget.mobile != null) {
        return _childWithPadding(dimension: constraints.maxWidth.dimensions(), child: widget.mobile!);
      }

      if (constraints.maxWidth.dimensions() == LayoutDimensions.tablet && widget.tablet != null) {
        return _childWithPadding(dimension: constraints.maxWidth.dimensions(), child: widget.tablet!);
      }

      return _childWithPadding(dimension: constraints.maxWidth.dimensions(), child: widget.desktop);
    });
  }

  _childWithPadding({required LayoutDimensions dimension, required Widget child}) {
    return Padding(
      padding: EdgeInsets.all(
        dimension == LayoutDimensions.mobile
            ? kSmallPadding
            : dimension == LayoutDimensions.tablet
                ? kMediumPadding
                : kVeryLargePadding,
      ),
      child: child,
    );
  }
}
