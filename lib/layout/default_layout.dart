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
          late Widget page;
          switch (settings.name) {
            case '/stock':
              page = const Stock();
              break;
            case '/':
            default:
              page = const Home();
          }

          return MaterialPageRoute(
            builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    page,
                  ],
                ),
              );
            },
            settings: settings,
          );
        },
        // child: SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        //   child: Stack(
        //     children: [
        //       child,
        //       const Positioned(
        //         bottom: 0,
        //         child: NavBar(),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
