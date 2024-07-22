import 'package:apk/models/laporan_pangan.dart';
import 'package:apk/service/preferencesService.dart';
import 'package:apk/ui/widgets/draft_data_tersimpan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:apk/shared/theme.dart';

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
  Future<List<LaporanPangan>> getTambahDataPangan() async {
    try {
      final dio = Dio();
      final userId = await PreferencesService().getId();
      final response = await dio.get(
        'https://sintrenayu.com/api/pangan/showByUser/$userId?status=terkirim',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      // Cek status code dari response
      if (response.statusCode == 200) {
        var data = response.data;

        // Cek format data apakah sesuai
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          List<dynamic> dataList = data['data'];

          // Parse setiap item dalam dataList menjadi LaporanPangan
          return dataList.map((item) => LaporanPangan.fromJson(item)).toList();
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
        builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No Data Found'));
              } else {
                List<LaporanPangan> dataPangan = snapshot.data!;
                return SingleChildScrollView(
                  child: Container(
                    color: kPrimaryColor,
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        for (var item in dataPangan)
                          draftDataPanganTersimpan(
                            laporanPangan: item,
                            isButtonVisible: false,
                            subjenisPangan: item.subjenisPangan,
                            jenis_pangan_id: item.jenisPanganId,
                            status: item.status == 0 ? false : true,
                            title1: 'Nama Pangan',
                            valueText1: item.subjenisPangan.name,
                            title2: 'Persediaan',
                            valueText2: item.stok.toString(),
                            title4: 'Harga',
                            valueText4: item.harga.toString(),
                            id: item.id.toString(),
                            onDelete: () {},
                          ),
                      ],
                    ),
                  ),
                );
              }
            },
      ),
    );
  }
}
