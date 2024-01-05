import 'package:flutter/material.dart';

class MouseGesture extends StatelessWidget {
  const MouseGesture({super.key, required this.child, required this.onTap});
  final Widget child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
