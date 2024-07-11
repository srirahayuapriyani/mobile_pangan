import 'dart:convert';

import 'package:apk/service/preferencesService.dart';
import 'package:apk/ui/widgets/draft_data_tersimpan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Perbaikan: Mengimport CustomTextFromField

class DraftData extends StatefulWidget {
  const DraftData({Key? key}) : super(key: key);

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
  @override
  _DraftDataState createState() => _DraftDataState();
}

class _DraftDataState extends State<DraftData> {
  Future<List<Map<String, dynamic>>> fetchTambahDataPangan() async {
    try {
      final dio = Dio();
      final userId = await PreferencesService().getId();
      final response = await dio.get(
        'https://sintrenayu.com/api/pangan/showByUser/$userId',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      print(response.data);

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

  void onDeleteCallback() {
    // Pembaruan state setelah penghapusan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data berhasil dihapus'),
      ),
    );
    Navigator.of(context).pushReplacementNamed('/draftdata');
  }

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> dataList = prefs.getStringList('data_pangan') ?? [];
  // List<Map<String, dynamic>> data = dataList.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
  //   return data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Draft Data',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: fetchTambahDataPangan(),
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
                        status: false,
                        title1: 'Nama Pangan',
                        valueText1: item['name'],
                        title2: 'Persediaan',
                        valueText2: item['stok'],
                        title4: 'Harga',
                        valueText4: item['harga'],
                        id: item['id'].toString(),
                        onDelete: onDeleteCallback,
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
  

        
//       body: SingleChildScrollView(
//         child: Container(
//           color: kPrimaryColor,
//           padding: const EdgeInsets.only(bottom: 100),
//           child: const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 10),
//               // Tambahkan widget searchField di sini
//               // searchField(),
//               SizedBox(height: 10),
//               // Tambahkan widget RiwayatDataPangan di sini
//               DraftRiwayatData(
//                 title1: 'Nama Pangan',
//                 valueText1: 'Bayam',
//                 title2: 'persediaan',
//                 valueText2: '20',
//                 // title3: 'Kebutuhan (Ton)',
//                 // valueText3: '20',
//                 title4: 'Harga (Rp/Kg)',
//                 valueText4: '1000',
//               ),
//               //Tambahkan widget RiwayatDataPangan lainnya di sini jika diperlukan
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
