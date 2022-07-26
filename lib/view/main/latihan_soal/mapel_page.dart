import 'package:flutter/material.dart';
import 'package:learning_app_final_project/view/main/latihan_soal/home_page.dart';
import 'package:learning_app_final_project/view/main/latihan_soal/paket_soal_page.dart';

class MapelPage extends StatelessWidget {
  const MapelPage({Key? key}) : super(key: key);
  static const String route = '/mapel_page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pilih Mata Pelajaran'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(PaketSoalPage.route);
                  },
                  child: MapelWidget(),
                );
              })),
        ),
      ),
    );
  }
}
