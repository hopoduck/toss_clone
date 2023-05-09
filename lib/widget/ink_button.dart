import 'package:flutter/material.dart';

class InkButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Function() onTap;
  const InkButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.decoration,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: decoration?.borderRadius != null
          ? decoration!.borderRadius!.resolve(Directionality.of(context))
          : null,
      child: Ink(
        width: width,
        height: height,
        color: color,
        padding: padding,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
