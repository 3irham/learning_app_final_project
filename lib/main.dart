import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app_final_project/view/login_page.dart';
import 'package:learning_app_final_project/view/main/discussion/chat_page.dart';
import 'package:learning_app_final_project/view/main/latihan_soal/home_page.dart';
import 'package:learning_app_final_project/view/main/profile/profile_page.dart';
import 'package:learning_app_final_project/view/main_page.dart';
import 'package:learning_app_final_project/view/register_page.dart';
import 'package:learning_app_final_project/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // home: SplashScreen(),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        LoginPage.route: (context) => const LoginPage(),
        RegisterPage.route: (context) => const RegisterPage(),
        MainPage.route: (context) => const MainPage(),
        HomePage.route: (context) => const HomePage(),
        ChatPage.route: (context) => const ChatPage(),
        ProfilePage.route: (context) => const ProfilePage(),
      },
    );
  }
}
