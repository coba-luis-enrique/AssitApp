import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQFLite',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
