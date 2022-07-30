import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_app_final_project/constants/r.dart';
import 'package:learning_app_final_project/constants/repository/auth_api.dart';
import 'package:learning_app_final_project/models/user_by_email.dart';
import 'package:learning_app_final_project/view/login_page.dart';
import 'package:learning_app_final_project/view/main_page.dart';
import 'package:learning_app_final_project/view/register_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String route = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () async {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final User = FirebaseAuth.instance.currentUser;
          if (User != null) {
            final dataUser = await AuthApi().getUserByEmail(User.email);
            if (dataUser != null) {
              final data = UserByEmail.fromJson(dataUser);
              if (data.status == 1) {
                Navigator.pushNamed(context, MainPage.route);
              } else {
                Navigator.pushNamed(context, RegisterPage.route);
              }
            }
          } else {
            Navigator.of(context).pushReplacementNamed(LoginPage.route);
          }
        }
      },
    );

    return Scaffold(
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(R.assets.icSplash),
      ),
    );
  }
}
