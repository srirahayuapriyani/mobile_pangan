import 'package:apk/ui/widgets/draft_riwayat_data.dart';
import 'package:flutter/material.dart';
import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart'; // Perbaikan: Mengimport CustomTextFromField

class DraftData extends StatelessWidget {
  const DraftData({Key? key}) : super(key: key);

  // Perbaikan: Memindahkan deklarasi searchField ke luar metode build
  Widget searchField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomTextFromField(
        title: '',
        hintText: 'Cari Pasar',
        obscureText: false,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Draft Data',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kPrimaryColor,
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              // Tambahkan widget searchField di sini
              searchField(),
              SizedBox(height: 10),
              // Tambahkan widget RiwayatDataPangan di sini
              const DraftRiwayatData(
                title1: 'Nama Pangan',
                valueText1: 'Bayam',
                title2: 'Ketersediaan (Ton)',
                valueText2: '20',
                title3: 'Kebutuhan (Ton)',
                valueText3: '20',
                title4: 'Harga (Rp/Kg)',
                valueText4: '1000',
              ),
              const DraftRiwayatData(
                title1: 'Nama Pangan',
                valueText1: 'Bayam',
                title2: 'Ketersediaan (Ton)',
                valueText2: '20',
                title3: 'Kebutuhan (Ton)',
                valueText3: '20',
                title4: 'Harga (Rp/Kg)',
                valueText4: '1000',
              ), 
                const DraftRiwayatData(
              title1: 'Nama Pangan',
              valueText1: 'Bayam',
              title2: 'Ketersediaan (Ton)',
              valueText2: '20',
              title3: 'Kebutuhan (Ton)',
              valueText3: '20',
              title4: 'Harga (Rp/Kg)',
              valueText4: '1000',
              ),
                const DraftRiwayatData(
              title1: 'Nama Pangan',
              valueText1: 'Bayam',
              title2: 'Ketersediaan (Ton)',
              valueText2: '20',
              title3: 'Kebutuhan (Ton)',
              valueText3: '20',
              title4: 'Harga (Rp/Kg)',
              valueText4: '1000',
              ),//Tambahkan widget RiwayatDataPangan lainnya di sini jika diperlukan
            ],
          ),
        ),
      ),
    );
  }
}
