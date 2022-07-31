import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_app_final_project/constants/r.dart';
import 'package:learning_app_final_project/helpers/user_email.dart';
import 'package:learning_app_final_project/models/network_response.dart';
import 'package:learning_app_final_project/models/user_by_email.dart';
import 'package:learning_app_final_project/repository/auth_api.dart';
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
        final user = UserEmail.getUserEmail();

        if (User != null) {
          final dataUser = await AuthApi().getUserByEmail();
          if (dataUser.status == Status.success) {
            final data = UserByEmail.fromJson(dataUser.data!);
            if (data.status == 1) {
              Navigator.of(context).pushNamed(MainPage.route);
            } else {
              Navigator.of(context).pushNamed(RegisterPage.route);
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
