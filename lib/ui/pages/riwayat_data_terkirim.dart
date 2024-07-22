import 'dart:convert';

import 'package:apk/service/preferencesService.dart';
import 'package:apk/ui/pages/draft_data.dart';
import 'package:apk/ui/widgets/draft_data_tersimpan.dart';
import 'package:dio/dio.dart';
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
    try {
      final dio = Dio();
      final userId = await PreferencesService().getId();
      final response = await dio.get(
        'https://sintrenayu.com/api/pangan/showByUser/$userId?status=terkirim',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      // print(" ini data ${response.data['data'][0]['subjenis_pangan']}");

      if (response.statusCode == 200) {
        var data = response.data;
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          List<dynamic> dataList = data['data'];
          return dataList.map((item) => item as Map<String, dynamic>).toList();
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
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
                        jenis_pangan_id: item['jenis_pangan_id'].toString(),
                        title1: 'Nama Pangan',
                        valueText1: item['subjenis_pangan']['name'],
                        title2: 'Persediaan',
                        valueText2: item['stok'],
                        title4: 'Harga',
                        valueText4: item['harga'],
                        id: item['id'].toString(),
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
