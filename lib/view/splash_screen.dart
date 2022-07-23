import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_app_final_project/view/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String route = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, LoginPage.route),
    );
    // () => Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => LoginPage(),
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Color(0xff01bdc2),
      body: Center(
        child: Image.asset('assets/auth/ic_splash.png'),
      ),
    );
  }
}
