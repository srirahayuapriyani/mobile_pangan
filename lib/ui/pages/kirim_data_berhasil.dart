import 'package:apk/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:apk/shared/theme.dart';

class KirimDataBerhasil extends StatelessWidget {
  static String routeName = "/kirim_data_berhasil";

  const KirimDataBerhasil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Kirim data',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 173,
                height: 150,
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image_success.png'),
                  ),
                ),
              ),
              Text(
                'Kirim Data Berhasil',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              homeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeButton(BuildContext context) {
    return CustomButton(
      width: 200,
      title: 'Kembali ke beranda',
      textStyle: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
      onPressed: () {
        Navigator.pushNamed(context, '/main');
      },
    );
  }
}
