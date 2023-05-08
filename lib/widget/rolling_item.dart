import 'dart:async';

import 'package:flutter/material.dart';

class RollingItem extends StatefulWidget {
  final double height;
  final List<Widget> children;
  const RollingItem({
    super.key,
    required this.height,
    required this.children,
  });

  @override
  State<RollingItem> createState() => _RollingItemState();
}

class _RollingItemState extends State<RollingItem>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Timer _timer;
  int target = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.addListener(() {
      setState(() {});
    });
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      // _animationController.reset();
      _animationController.forward().then((value) {
        target += 1;
        _animationController.reset();
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  int get targetIndex => target % widget.children.length;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            top: (_animationController.value + targetIndex) * -widget.height,
            child: Column(
              children: [
                for (var i = 0; i < widget.children.length; i++)
                  Opacity(
                    // opacity:
                    // targetIndex == 0 ? 1 - _animationController.value : 0,
                    opacity: 1,
                    child: widget.children[i],
                  ),
                Opacity(
                  // opacity:
                  // targetIndex == 0 ? 1 - _animationController.value : 0,
                  opacity: 1,
                  child: widget.children.first,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
