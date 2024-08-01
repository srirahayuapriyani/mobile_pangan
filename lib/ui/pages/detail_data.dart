import 'package:apk/models/laporan_pangan.dart';
import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';

class DetailData extends StatelessWidget {
  const DetailData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)
                          ?.settings
                          .arguments as Map<String, dynamic>?;
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

    Widget namapasar(LaporanPangan laporanPangan) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Pangan Pasar Bangkir',
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
                  laporanPangan.date,
                ),
              ],
            ),
            // SizedBox(height: 10),
            // Row(
            //   // Tambahkan Row untuk teks 'Jam' di sini
            //   children: [
            //     Text(
            //       'Jam',
            //       style: semiblackTextStyle.copyWith(
            //         fontSize: 14,
            //         fontWeight: semiBold,
            //       ),
            //     ),
            //     Spacer(),
            //     Text(laporanPangan.), // Tambahkan Spacer untuk mencentang ke sisi kanan
            //   ],
            // ),
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
                Text(laporanPangan.user.name), // Tambahkan Spacer untuk mencentang ke sisi kanan
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
                    laporanPangan.subjenisPangan.name), // Tambahkan Spacer untuk mencentang ke sisi kanan
              ],
            ),
            // SizedBox(height: 10),
            // Row(
            //   // Tambahkan Row untuk teks 'Jam' di sini
            //   children: [
            //     // Text(
            //     //   'Sub Jenis Pangan',
            //     //   style: semiblackTextStyle.copyWith(
            //     //     fontSize: 14,
            //     //     fontWeight: semiBold,
            //     //   ),
            //     // ),
            //     // Spacer(),
            //     // Text('20'), // Tambahkan Spacer untuk mencentang ke sisi kanan
            //   ],
            // ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row untuk teks 'Jam' di sini
              children: [
                Text(
                  'persediaan',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text(laporanPangan.stok.toString()), // Tambahkan Spacer untuk mencentang ke sisi kanan
              ],
            ),
            SizedBox(height: 10),
            Row(
              // Tambahkan Row untuk teks 'Jam' di sini
              children: [
                Text(
                  'Harga',
                  style: semiblackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Spacer(),
                Text(laporanPangan.harga.toString()), // Tambahkan Spacer untuk mencentang ke sisi kanan
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
            namapasar(arguments!['laporan_pangan']),
          ],
        ),
      ),
    );
  }
}
