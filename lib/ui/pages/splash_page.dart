import 'dart:async'; // Tambahkan ini untuk menggunakan Timer
import 'package:flutter/material.dart';
import 'package:apk/service/preferencesService.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Pastikan PreferencesService telah diinisialisasi
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {

    await Future.delayed(Duration(seconds: 3));
    bool isLoggedIn = PreferencesService().isLoggedIn;
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/main', arguments: {
        'username': PreferencesService().getUsername(),
        'password': PreferencesService().getPassword(),
        });
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 220,
              height: 200,
              margin: EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Selamat Datang Di Aplikasi Pangan Indramayu',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Aplikasi ini dibuat untuk membantu petugas pasar memasukan data pangan dan mengelola data pangan.',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: reguler,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Center(
        child: Text('Get Started Page'),
      ),
    );
  }
}
