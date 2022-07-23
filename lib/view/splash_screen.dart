import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_app_final_project/constants/r.dart';
import 'package:learning_app_final_project/view/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String route = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, LoginPage.route),
    );
    // () => Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => LoginPage(),
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(R.assets.icSplash),
      ),
    );
  }
}
