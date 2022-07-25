import 'package:flutter/material.dart';
import 'package:learning_app_final_project/constants/r.dart';
import 'package:learning_app_final_project/view/main/discussion/chat_page.dart';
import 'package:learning_app_final_project/view/main/latihan_soal/home_page.dart';
import 'package:learning_app_final_project/view/main/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String route = '/main_page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pc = PageController(initialPage: 0);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ChatPage.route);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Center(
            child: Image.asset(
              R.assets.icDiscuss,
              width: 50,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigation(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pc,
        children: [
          HomePage(),
          // ChatPage(),
          ProfilePage(),
        ],
      ),
    );
  }

  Container _buildBottomNavigation() {
    return Container(
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
                      onTap: () {
                        index = 0;
                        _pc.animateToPage(index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.bounceInOut);
                      },
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
                          Opacity(opacity: 0),
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
                      onTap: () {
                        index = 1;
                        _pc.animateToPage(index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.bounceInOut);
                      },
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
    );
  }
}
