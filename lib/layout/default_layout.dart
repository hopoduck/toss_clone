import 'package:flutter/material.dart';
import 'package:toss_clone/screen/home.dart';
import 'package:toss_clone/screen/stock.dart';
import 'package:toss_clone/widget/nav_bar.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.payment_rounded,
              color: Colors.white.withOpacity(0.8),
            ),
            const SizedBox(width: 5),
            const Text("Toss"),
          ],
        ),
        elevation: 0,
      ),
      bottomNavigationBar: const NavBar(),
      body: Navigator(
        key: navigatorKey,
        initialRoute: "/",
        onGenerateRoute: (settings) {
          Widget page = _getCurrentPage(settings.name!);
          return _createRoute(page, settings: settings);
          // return MaterialPageRoute(
          //   builder: (context) {
          //     return SizedBox(
          //       width: MediaQuery.of(context).size.width,
          //       height: MediaQuery.of(context).size.height,
          //       child: Stack(
          //         children: [
          //           page,
          //         ],
          //       ),
          //     );
          //   },
          //   settings: settings,
          // );
        },
      ),
    );
  }
}

Widget _getCurrentPage(String? routeName) {
  switch (routeName) {
    case '/stock':
      return const Stock();
    case '/':
    default:
      return const Home();
  }
}

Route _createRoute(Widget page, {required RouteSettings settings}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) {
      var tween = Tween(begin: 1.0, end: 0.0);
      return page;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-0.4, 0.0);
      const end = Offset.zero;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.ease,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}
