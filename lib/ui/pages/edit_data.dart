import 'package:apk/ui/widgets/custom_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:apk/service/preferencesService.dart'; // Sesuaikan path service PreferencesService
import 'package:apk/shared/theme.dart'; // Sesuaikan path theme jika berbeda
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart'; // Sesuaikan path widget jika berbeda

class EditData extends StatefulWidget {
  // final Map<String, dynamic> draftData;

  const EditData({Key? key}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController namaPanganController = TextEditingController();
  TextEditingController persediaanController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    print('here');
    _initializeData();
  }

Future<void> update(String id,int status) async {
    var data = {
      'name': namaPanganController.text,
      'stok': persediaanController.text,
      'harga': hargaController.text,
      'status': status,
      '_method': 'put',
    };

    print(data);

    try {
      Response response = await _dio.post(
        'https://sintrenayu.com/api/pangan/update/$id', // Ganti dengan URL endpoint API Anda
        data: data,
        options: Options(headers: {'Accept': 'application/json'}),
      );
      print('this is response ${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data berhasil disimpan');
        Navigator.pushNamed(context, '/draftdata');
        // Lakukan sesuatu jika data berhasil disimpan
      } else {
        print('Gagal menyimpan data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

String getCurrentDateFormatted() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  Future<void> _initializeData() async {
    try {
    } catch (e) {
      print('Error initializing data: $e');
      // Handle error jika diperlukan
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
          print(arguments?['nama']);
        final id = arguments?['id'];
      setState(() {
        namaPanganController.text = arguments!['nama'];
        persediaanController.text = arguments['persediaan'].toString();
        hargaController.text = arguments['harga'].toString();
      });
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
            CustomTextFromField(
              controller: namaPanganController,
              title: 'Nama Pangan',
              hintText: 'Masukan Nama Pangan',
            ),
            CustomTextFromField(
              controller: persediaanController,
              title: 'Persediaan',
              hintText: 'Masukan Ketersediaan',
            ),
            // const CustomTextFromField(
            //   title: 'kebutuhan',
            //   hintText: 'Masukan kebutuhan',
            // ),
            CustomTextFromField(
              controller: hargaController,
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
                update(id, 0);
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
          'Edit Data',
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
