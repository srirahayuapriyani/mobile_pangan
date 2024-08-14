import 'package:apk/models/laporan_pangan.dart';
import 'package:apk/service/preferencesService.dart';
import 'package:apk/ui/widgets/draft_data_tersimpan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:apk/shared/theme.dart';
import 'package:intl/intl.dart';

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
  DateTime selectedDate = DateTime.now();
  List<LaporanPangan> dataPangan = [];
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<LaporanPangan> data = await fetchTambahDataPangan(
      date: DateFormat('yyyy-MM-dd').format(selectedDate),
    );
    setState(() {
      dataPangan = data;
    });
  }

  Future<List<LaporanPangan>> fetchTambahDataPangan({String? date}) async {
    try {
      final dio = Dio();
      final userId = await PreferencesService().getId();
      final url = date != null
          ? 'https://sintrenayu.com/api/pangan/showByUser/$userId?date=$date'
          : 'https://sintrenayu.com/api/pangan/showByUser/$userId?status=tersimpan';
      final response = await dio.get(
        url,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          List<dynamic> dataList = data['data'];
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

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
      _fetchData();
    }
  }

  void onDeleteCallback() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data berhasil dihapus'),
      ),
    );
    Navigator.of(context).pushReplacementNamed('/draftdata');
  }

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Pilih Tanggal...',
                      hintText: DateFormat('dd/MM/yyyy').format(selectedDate),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: _pickDate,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _fetchData, // Fungsi yang dipanggil saat refresh
              child: FutureBuilder<List<LaporanPangan>>(
                future: fetchTambahDataPangan(
                    date: DateFormat('yyyy-MM-dd').format(selectedDate)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Data Found'));
                  } else {
                    List<LaporanPangan> dataPangan = snapshot.data!;
                    return ListView(
                      // Ganti SingleChildScrollView dengan ListView
                      children: [
                        Container(
                          color: kPrimaryColor,
                          padding: const EdgeInsets.only(bottom: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              for (var item in dataPangan)
                                draftDataPanganTersimpan(
                                  laporanPangan: item,
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
                                  onDelete: () => onDeleteCallback(),
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
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
