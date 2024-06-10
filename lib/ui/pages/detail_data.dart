import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';

class DetailData extends StatelessWidget {
  const DetailData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/image_detail_pasar.png',
            ),
          ),
        ),
      );
    }

    Widget namapasar() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Pangan Pasar Jatibarang',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row di sini
              children: [
                Text(
                  'Tanggal',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text(
                  'Sabtu, 21 April 2024',
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row untuk teks 'Jam' di sini
              children: [
                Text(
                  'Jam',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text(
                    '15:00 Wib'), // Tambahkan Spacer untuk mencentang ke sisi kanan
              ],
            ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row untuk teks 'Jam' di sini
              children: [
                Text(
                  'Petugas Pasar',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text('Ayu'), // Tambahkan Spacer untuk mencentang ke sisi kanan
              ],
            ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row untuk teks 'Jam' di sini
              children: [
                Text(
                  'Nama Pangan',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text(
                    'Beras'), // Tambahkan Spacer untuk mencentang ke sisi kanan
              ],
            ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row untuk teks 'Jam' di sini
              children: [
                Text(
                  'ketersediaan (Ton)',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text('20'), // Tambahkan Spacer untuk mencentang ke sisi kanan
              ],
            ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row untuk teks 'Jam' di sini
              children: [
                Text(
                  'Kebutuhan (Ton)',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text('20'), // Tambahkan Spacer untuk mencentang ke sisi kanan
              ],
            ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row untuk teks 'Jam' di sini
              children: [
                Text(
                  'Harga (Rp/Kg)',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text(
                    '10000'), // Tambahkan Spacer untuk mencentang ke sisi kanan
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Menengahkan judul
        title: Text(
          'Detail Data',
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
            backgroundImage(),
            namapasar(),
          ],
        ),
      ),
    );
  }
}
