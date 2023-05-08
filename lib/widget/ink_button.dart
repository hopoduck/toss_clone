import 'package:flutter/material.dart';

class InkButton extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  const InkButton({
    super.key,
    this.decoration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: decoration,
      // decoration: const BoxDecoration(borderRadius: BorderRadius),
      child: InkWell(
        borderRadius: decoration?.borderRadius != null
            ? decoration!.borderRadius!.cast<BorderRadius>()
            : null,
        child: child,
      ),
    );
  }
}
