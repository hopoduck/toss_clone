import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final Icon icon;
  final Widget title;
  final Widget? rightWidget;
  const Item({
    super.key,
    required this.icon,
    required this.title,
    this.rightWidget,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
      scale: focused ? 0.98 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTapDown: (details) {
            setState(() {
              focused = true;
            });
          },
          onTapUp: (details) {
            setState(() {
              focused = false;
            });
          },
          onTapCancel: () {
            setState(() {
              focused = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: widget.icon,
                    ),
                    const SizedBox(width: 10),
                    widget.title,
                  ],
                ),
                // const Expanded(child: SizedBox()),
                if (widget.rightWidget != null) widget.rightWidget!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
