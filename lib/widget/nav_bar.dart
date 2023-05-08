import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toss_clone/layout/default_layout.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xff404040),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
        ),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavButton(
            icon: const Icon(Icons.home),
            text: "홈",
            onPressed: () {
              late String name;
              navigatorKey.currentState!.popUntil((route) {
                name = route.settings.name!;
                return true;
              });
              if (name != '/') {
                navigatorKey.currentState!.pushReplacementNamed("/");
              }
            },
          ),
          NavButton(
            icon: const Icon(Icons.diamond),
            text: "혜택",
            onPressed: () {},
          ),
          NavButton(
            icon: const Icon(Icons.attach_money),
            text: "송금",
            onPressed: () {},
          ),
          NavButton(
            icon: const Icon(Icons.query_stats),
            text: "주식",
            onPressed: () {
              late String name;
              navigatorKey.currentState!.popUntil((route) {
                name = route.settings.name!;
                return true;
              });
              if (name != '/stock') {
                navigatorKey.currentState!.pushReplacementNamed("/stock");
              }
            },
          ),
          NavButton(
            icon: const Icon(Icons.menu),
            text: "전체",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatefulWidget {
  final Icon icon;
  final String text;
  final Function() onPressed;
  const NavButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    );
    _animation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void tapHandler() {
    widget.onPressed();
    _animationController
        .forward()
        .then((value) => _animationController.reset());
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: -0.8 * pow((_animation.value - 0.5), 2) + 1.2,
      scaleY: -0.8 * -pow((_animation.value - 0.5), 2) + 0.8,
      child: Container(
        width: 60,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: MaterialButton(
            onPressed: () {
              tapHandler();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon,
                Text(widget.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
