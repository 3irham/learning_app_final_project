import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app_final_project/constants/r.dart';
import 'package:learning_app_final_project/view/login_page.dart';
import 'package:learning_app_final_project/view/main/discussion/chat_page.dart';
import 'package:learning_app_final_project/view/main/latihan_soal/home_page.dart';
import 'package:learning_app_final_project/view/main/latihan_soal/mapel_page.dart';
import 'package:learning_app_final_project/view/main/latihan_soal/paket_soal_page.dart';
import 'package:learning_app_final_project/view/main/profile/profile_page.dart';
import 'package:learning_app_final_project/view/main_page.dart';
import 'package:learning_app_final_project/view/register_page.dart';
import 'package:learning_app_final_project/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options:
      );
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
        appBarTheme: AppBarTheme(
          color: R.colors.primary,
        ),
      ),
      // home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        LoginPage.route: (context) => const LoginPage(),
        RegisterPage.route: (context) => const RegisterPage(),
        MainPage.route: (context) => const MainPage(),
        HomePage.route: (context) => const HomePage(),
        ChatPage.route: (context) => const ChatPage(),
        ProfilePage.route: (context) => const ProfilePage(),
        MapelPage.route: (context) => const MapelPage(),
        PaketSoalPage.route: (context) => const PaketSoalPage(),
      },
    );
  }
}
