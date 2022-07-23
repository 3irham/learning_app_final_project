import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app_final_project/constants/r.dart';
import 'package:learning_app_final_project/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/login_screen';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  R.strings.login,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(R.assets.imgLogin),
              const SizedBox(height: 35),
              Text(
                R.strings.welcome,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                R.strings.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  color: R.colors.greySubtitile,
                ),
              ),
              const Spacer(),
              ButtonLogin(
                backgroundColor: Colors.white,
                borderColor: R.colors.primary,
                onTap: () {
                  Navigator.pushNamed(context, RegisterPage.route);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(R.assets.icGoogle),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      R.strings.loginWithGoogle,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        color: R.colors.blackLogin,
                      ),
                    ),
                  ],
                ),
              ),
              ButtonLogin(
                backgroundColor: Colors.black,
                borderColor: Colors.black,
                onTap: () {
                  Navigator.pushNamed(context, RegisterPage.route);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(R.assets.icApple),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      R.strings.loginWithGoogle,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  final Color backgroundColor;
  final Color borderColor;
  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: borderColor,
            ),
          ),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
