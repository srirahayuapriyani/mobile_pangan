import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';

class UbahData extends StatelessWidget {
  const UbahData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget namapasar() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 10),
            // CustomButton(
            //   width: 191,
            //   height: 35, // Panggil CustomButton di sini
            //   title: 'Sab, 20 april 2024',
            //   textStyle: blueTextStyle.copyWith(
            //     fontSize: 16,
            //     fontWeight: medium,
            //   ),
            //   iconAssetPath: 'assets/CalendarBlank.svg',
            //   onPressed: () {
            //     // Aksi yang ingin dilakukan ketika tombol ditekan
            //   },
            //   backgroundColor:
            //       kBlueColor2, // Atur warna latar belakang sesuai keinginan
            //   borderRadius: 30, // Atur nilai border radius sesuai keinginan
            // ),
            // Text(
            //   'Ubah Data Beras',
            //   style: blackTextStyle.copyWith(
            //     fontSize: 16,
            //     fontWeight: semiBold,
            //   ),
            // ),
            SizedBox(height: 10),
            const CustomTextFromField(
              title: 'Nama Pangan',
              hintText: 'Masukan Nama Pangan',
            ),
            const CustomTextFromField(
              title: 'Persediaan',
              hintText: 'Masukan Ketersediaan',
            ),
            // const CustomTextFromField(
            //   title: 'kebutuhan',
            //   hintText: 'Masukan kebutuhan',
            // ),
            const CustomTextFromField(
              title: 'Harga',
              hintText: 'Masukan harga',
            ),
            CustomButton(
              title: 'Simpan data',
              width: MediaQuery.of(context).size.width,
              textStyle: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/draftdata');
              },
            ),
            SizedBox(height: 10),
            CustomButton(
              title: 'Kirim data',
              width: MediaQuery.of(context).size.width,
              backgroundColor: kOrangeColor,
              textStyle: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/kirimdataberhasil');
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Menengahkan judul
        title: Text(
          'Ubah Data',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            namapasar(),
          ],
        ),
      ),
    );
  }
}
