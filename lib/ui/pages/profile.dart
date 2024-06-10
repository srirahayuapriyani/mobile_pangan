import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget inputSection() {
      Widget namaInput() {
        return const CustomTextFromField(
          title: 'Pengguna',
          hintText: 'Nama Pengguna',
        );
      }

      Widget katasandiInput() {
        return const CustomTextFromField(
          title: 'Kata Sandi',
          hintText: 'Masukan Kata Sandi',
          obscureText: true,
        );
      }

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
            // Implementasikan fungsi onPressed sesuai kebutuhan
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
            katasandiInput(),
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
