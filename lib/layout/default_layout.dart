import 'package:flutter/material.dart';
import 'package:toss_clone/screen/home.dart';
import 'package:toss_clone/screen/stock.dart';
import 'package:toss_clone/widget/nav_bar.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

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
          late Widget page;
          switch (settings.name) {
            case '/stock':
              page = const Stock();
              break;
            case '/':
            default:
              page = const Home();
          }

          return _createRoute(page);
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
