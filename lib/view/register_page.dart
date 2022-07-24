import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app_final_project/constants/r.dart';
import 'package:learning_app_final_project/view/login_page.dart';
import 'package:learning_app_final_project/view/main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const String route = '/register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender { lakiLaki, perempuan }

class _RegisterPageState extends State<RegisterPage> {
  String gender = 'Laki-laki';
  List<String> classSlta = ['10', '11', '12'];
  String selectedClass = '10';

  onTap(Gender genderInput) {
    setState(() {
      if (genderInput == Gender.lakiLaki) {
        gender = 'Laki-laki';
      } else {
        gender = 'Perempuan';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Yuk isi data diri!',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterTextField(
                tiitle: 'Nama Lengkap',
                hintText: 'Nama Lengkap',
              ),
              SizedBox(height: 24),
              RegisterTextField(
                tiitle: 'Email',
                hintText: 'Email anda',
              ),
              SizedBox(height: 24),
              Text(
                'tiitle',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == 'Laki-laki'
                              ? R.colors.primary
                              : Colors.white,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: R.colors.greyBorder,
                              width: 1,
                            ),
                          ),
                        ),
                        onPressed: () {
                          onTap(Gender.lakiLaki);
                        },
                        child: Text(
                          'Laki-laki',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            color: gender == 'Laki-laki'
                                ? Colors.white
                                : Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: gender == 'Perempuan'
                              ? R.colors.primary
                              : Colors.white,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: R.colors.greyBorder,
                              width: 1,
                            ),
                          ),
                        ),
                        onPressed: () {
                          onTap(Gender.perempuan);
                        },
                        child: Text(
                          'Perempuan',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            color: gender == 'Perempuan'
                                ? Colors.white
                                : Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Kelas',
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: R.colors.greyBorder),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: selectedClass,
                      items: classSlta
                          .map(
                            (e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (String? val) {
                        selectedClass = val!;
                        setState(() {});
                      }),
                ),
              ),
              SizedBox(height: 24),
              RegisterTextField(
                tiitle: 'Nama Sekolah',
                hintText: 'Nama Sekolah',
              ),
              Spacer(),
              ButtonLogin(
                backgroundColor: R.colors.primary,
                borderColor: R.colors.primary,
                onTap: () {
                  Navigator.pushNamed(context, MainPage.route);
                },
                child: Text(
                  R.strings.daftar,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    color: Colors.white,
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

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    required this.tiitle,
    required this.hintText,
  }) : super(key: key);
  final String tiitle;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tiitle,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
              color: R.colors.greyBorder,
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                color: R.colors.greyHintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
