import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coffee_shop/registration/log_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/twocup.png',

        ),
        nextScreen: LogInScreen(),
        splashIconSize: 400,

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
