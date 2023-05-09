import 'package:flutter/material.dart';
import 'package:toss_clone/layout/default_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toss Clone',
      theme: ThemeData(
        primaryColor: Colors.black.withOpacity(0.8),
        colorScheme: ColorScheme(
          primary: Colors.black.withOpacity(0.8),
          onPrimary: Colors.black87.withOpacity(0.6),
          secondary: Colors.amber,
          onSecondary: Colors.amber.shade600,
          error: Colors.red.shade800,
          onError: Colors.red.shade600,
          brightness: Brightness.dark,
          background: Colors.black.withOpacity(0.8),
          onBackground: Colors.black.withOpacity(0.8),
          surface: Colors.black,
          onSurface: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          color: const Color(0xff303030),
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.bold,
            fontFamily: "Pretendard",
          ),
        ),
        fontFamily: "Pretendard",
        fontFamilyFallback: const ["NotoColorEmoji"],
      ),
      home: const DefaultLayout(),
      // {
      //   "/": (context) => const Home(),
      //   "/stock": (context) => const Stock(),
      // },
      // routes: {
      //   "/": (context) => const Home(),
      //   "/stock": (context) => const Stock(),
      // },
      // initialRoute: "/",
    );
  }
}
