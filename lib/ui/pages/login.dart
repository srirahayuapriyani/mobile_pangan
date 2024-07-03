import 'package:apk/service/preferencesService.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/theme.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

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

    Future<void> loginProcess() async {
      final dio = Dio();
      var data = {
        'username': username.text,
        'password': password.text,
      };

      var response = await dio.post('https://sintrenayu.com/api/login',
          data: data,
          options: Options(headers: {'Accept': 'application/json'}));

      if (response.statusCode == 200) {
        print(response.data);

        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setBool('isLoggedIn', true);
        await PreferencesService().setLoggedIn(true);


        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/main');
      } else {
        print(response.statusMessage);
      }
    }

    Widget inputSection() {
      Widget namaInput() {
        return CustomTextFromField(
          controller: username,
          title: 'Nama Pengguna',
          hintText: 'Masukan Nama Pengguna',
          validator: (value) {
            return value == null || value.isEmpty
                ? "nama pengguna tidak boleh kosong"
                : null;
          },
        );
      }

      Widget katasandiInput() {
        return CustomTextFromField(
          controller: password,
          title: 'kata Sandi',
          hintText: 'Masukan Kata Sandi',
          obscureText: true,
          validator: (value) {
            return value == null || value.isEmpty
                ? "kata sandi tidak boleh kosong"
                : null;
          },
        );
      }

      Widget loginButton() {
        return CustomButton(
          title: 'Masuk',
          textStyle: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
          onPressed: () {
            loginProcess();
            // Navigator.pushNamed(context, '/main');
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
