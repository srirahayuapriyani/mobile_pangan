import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Selamat Datang',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget additionalText() {
      return Container(
        child: Text(
          'Silahkan masukan data yang dimasukan untuk mengakses aplikasi',
          style: semiblackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: reguler,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget namaInput() {
        return CustomTextFromField(
          title: 'Nama Pengguna',
          hintText: 'Masukan Nama Pengguna',
        );
      }

      Widget katasandiInput() {
        return CustomTextFromField(
          title: 'kata Sandi', 
          hintText: 'Masukan Kata Sandi',
          obscureText: true,
          );
      }
        Widget loginButton(){
          return CustomButton(
            title: 'Masuk',
            textStyle: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
            onPressed: (){
              Navigator.pushNamed(context, '/main');
            },
          );
        }


      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
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

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          children: [
            title(),
            additionalText(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
