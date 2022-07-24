import 'package:flutter/material.dart';
import 'package:learning_app_final_project/constants/r.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String route = '/main_page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Container(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Material(
                      child: InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              R.assets.icHome,
                              height: 20,
                            ),
                            Text('Home'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Material(
                      child: InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              R.assets.icDiscuss,
                              height: 20,
                            ),
                            Text('Diskusi Soal'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Material(
                      child: InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              R.assets.icProfile,
                              height: 20,
                            ),
                            Text('Profil'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
