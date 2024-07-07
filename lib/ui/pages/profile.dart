import 'dart:developer';

import 'package:apk/service/preferencesService.dart';
import 'package:apk/shared/theme.dart';
import 'package:apk/ui/pages/login.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String username;
  final String password;

  const Profile({Key? key, this.username = "", this.password = ""})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

TextEditingController usernameC = TextEditingController();

class _ProfileState extends State<Profile> {
  Future<void> _initializeData() async {
    String data = PreferencesService().getUsername();
    setState(() {
      usernameC.text = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
    log(usernameC.text);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> logoutProcess() async {
      await PreferencesService().setLoggedIn(false);
      // Navigator.pushAndRemoveUntil(context, '/login' as Route<Object?>, (route) => false);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const Login()), (route) => false);
    }

    Widget inputSection() {
      Widget namaInput() {
        return CustomTextFromField(
          controller: usernameC,
          title: 'Pengguna',
          hintText: 'Nama Pengguna',
          readOnly: true,
        );
      }

      // Widget katasandiInput() {
      //   return const CustomTextFromField(
      //     title: 'Kata Sandi',
      //     hintText: 'Masukan Kata Sandi',
      //     obscureText: true,
      //     readOnly: true,
      //   );
      // }

      Widget loginButton() {
        return CustomButton(
          title: 'keluar',
          width: MediaQuery.of(context).size.width,
          backgroundColor: kRedColor,
          textStyle: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
          onPressed: () {
            logoutProcess();
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            namaInput(),
            // katasandiInput(),
            loginButton(),
          ],
        ),
      );
    }

    Widget profileImage() {
      return const Center(
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
              'assets/image_profile.png'), // Path ke gambar profile Anda
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          profileImage(),
          inputSection(),
        ],
      ),
    );
  }
}
