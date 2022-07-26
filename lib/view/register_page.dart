import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app_final_project/constants/r.dart';
import 'package:learning_app_final_project/helpers/user_email.dart';
import 'package:learning_app_final_project/models/network_response.dart';
import 'package:learning_app_final_project/models/user_by_email.dart';
import 'package:learning_app_final_project/repository/auth_api.dart';
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
  List<String> classSlta = ['10', '11', '12'];

  String gender = 'Laki-laki';
  String selectedClass = '10';
  final emailController = TextEditingController();
  final schoolNameController = TextEditingController();
  final fullNameController = TextEditingController();

  initDataUser() {
    emailController.text = UserEmail.getUserEmail()!;
    fullNameController.text = UserEmail.getUserDisplayName()!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initDataUser();
  }

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
    return Scaffold(
      backgroundColor: Color(0xffF0F3F5),
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: ButtonLogin(
            backgroundColor: R.colors.primary,
            borderColor: R.colors.primary,
            onTap: () async {
              final json = {
                'email': emailController.text,
                'nama_lengkap': fullNameController.text,
                'nama_sekolah': schoolNameController.text,
                'kelas': selectedClass,
                'gender': gender,
                'foto': UserEmail.getUserPhotoUrl()
              };
              print(json);
              final result = await AuthApi().postRegister(json);
              if (result.status == Status.success) {
                final registerResult = UserByEmail.fromJson(result.data!);
                if (registerResult.status == 1) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      MainPage.route, (context) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(registerResult.message!),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Terjadi kesalahan'),
                  ),
                );
              }
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
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterTextField(
                controller: emailController,
                tiitle: 'Email',
                hintText: 'Email anda',
                enabled: false,
              ),
              SizedBox(height: 24),
              RegisterTextField(
                tiitle: 'Nama Lengkap',
                hintText: 'Nama Lengkap',
                controller: fullNameController,
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
                controller: schoolNameController,
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
    this.controller,
    this.enabled = true,
  }) : super(key: key);
  final String tiitle;
  final String hintText;
  final bool enabled;
  final TextEditingController? controller;

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
            enabled: enabled,
            controller: controller,
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
