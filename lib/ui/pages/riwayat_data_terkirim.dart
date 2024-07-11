import 'dart:convert';

import 'package:apk/ui/pages/draft_data.dart';
import 'package:apk/ui/widgets/draft_data_tersimpan.dart';
import 'package:flutter/material.dart';
import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Perbaikan: Mengimport CustomTextFromField

class RiwayatDataTerkirim extends StatelessWidget {
  const RiwayatDataTerkirim({Key? key}) : super(key: key);

  // Perbaikan: Memindahkan deklarasi searchField ke luar metode build
  // Widget searchField() {
  //   return const Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 10),
  //     child: CustomTextFromField(
  //       title: '',
  //       hintText: 'Cari Pasar',
  //       obscureText: false,
  //       prefixIcon: Icon(Icons.search),
  //     ),
  //   );
  // }
  Future<List<Map<String, dynamic>>> getTambahDataPangan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dataList = prefs.getStringList('data_pangan') ?? [];
    List<Map<String, dynamic>> data = dataList
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Riwayat Data ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: getTambahDataPangan(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
            return Center(child: Text('No Data Found'));
          } else {
            List<Map<String, dynamic>> data_pangan =
                snapshot.data as List<Map<String, dynamic>>;
            return SingleChildScrollView(
              child: Container(
                color: kPrimaryColor,
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    for (var item in data_pangan)
                      draftDataPanganTersimpan(
                        status: true,
                        isButtonVisible: false,
                        title1: 'Nama Pangan',
                        valueText1: item['Nama Pangan'],
                        title2: 'Persediaan',
                        valueText2: item['Persediaan'],
                        title4: 'Harga',
                        valueText4: item['Harga'],
                        id: '1',
                        onDelete: () {},
                      ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
