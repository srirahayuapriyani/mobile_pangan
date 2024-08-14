import 'package:apk/models/laporan_pangan.dart';
import 'package:apk/service/preferencesService.dart';
import 'package:apk/ui/widgets/draft_data_tersimpan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:apk/shared/theme.dart';
import 'package:intl/intl.dart';

class RiwayatDataTerkirim extends StatefulWidget {
  const RiwayatDataTerkirim({Key? key}) : super(key: key);

  @override
  _RiwayatDataTerkirimState createState() => _RiwayatDataTerkirimState();
}

class _RiwayatDataTerkirimState extends State<RiwayatDataTerkirim> {
  DateTime selectedDate = DateTime.now();
  List<LaporanPangan> dataPangan = [];
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
  }

  Future<List<LaporanPangan>> getTambahDataPangan() async {
    try {
      final dio = Dio();
      final userId = await PreferencesService().getId();
      final response = await dio.get(
        'https://sintrenayu.com/api/pangan/showByUser/$userId?status=terkirim',
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Riwayat Data',
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
            child: FutureBuilder<List<LaporanPangan>>(
              future: getTambahDataPangan(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No Data Found'));
                } else {
                  List<LaporanPangan> filteredData = snapshot.data!.where((item) {
                    return DateFormat('yyyy-MM-dd').format(DateTime.parse(item.date)) ==
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                  }).toList();

                  return SingleChildScrollView(
                    child: Container(
                      color: kPrimaryColor,
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var item in filteredData)
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
          ),
        ],
      ),
    );
  }
}
