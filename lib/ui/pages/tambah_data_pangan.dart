// import 'package:apk/ui/widgets/custom_button.dart';
// import 'package:apk/ui/widgets/custom_text_form_field.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../shared/theme.dart';
// import 'package:intl/intl.dart';

// class TambahDataPangan extends StatefulWidget {
//   const TambahDataPangan({Key? key}) : super(key: key);

//   @override
//   State<TambahDataPangan> createState() => _TambahDataPanganState();
// }

// class _TambahDataPanganState extends State<TambahDataPangan> {
//   @override
//   Widget build(BuildContext context) {
//     // final arguments = (ModalRoute.of(context)?.settings.arguments ??
//     //     <String, dynamic>{}) as Map;

//     TextEditingController namaC = TextEditingController();
//     TextEditingController ketersediaanC = TextEditingController();
//     TextEditingController kebutuhanC = TextEditingController();
//     TextEditingController hargaC = TextEditingController();
//     final formKey = GlobalKey<FormState>();

//     Future<void> store() async {
//       var data = {
//         'nama': namaC.text,
//         'ketersediaan': ketersediaanC.text,
//         'kebutuhan': kebutuhanC.text,
//         'harga': hargaC.text,
//         'tanggal': DateFormat.yMMMMEEEEd().add_jm().format(DateTime.now()),
//       };
//       // print(arguments['jenis_pangan_id']);
//       print(data);
//     }
//     // bool validateInputs() {
//     //   if (namaC.text.isEmpty) {
//     //     showDialog(
//     //       context: context,
//     //       builder: (context) => AlertDialog(
//     //         title: Text('Error'),

//     //         content: Text('data tidak boleh kosong'),
//     //         actions: <Widget>[
//     //           TextButton(
//     //             child: Text('OK'),
//     //             onPressed: () => Navigator.of(context).pop(),
//     //           ),
//     //         ],
//     //       ),
//     //     );
//     //     return false;
//     //   }
//     //   if (ketersediaanC.text.isEmpty) {
//     //     showDialog(
//     //       context: context,
//     //       builder: (context) => AlertDialog(
//     //         title: Text('Error'),

//     //         content: Text('Ketersediaan tidak boleh kosong'),
//     //         actions: <Widget>[
//     //           TextButton(
//     //             child: Text('OK'),
//     //             onPressed: () => Navigator.of(context).pop(),
//     //           ),
//     //         ],
//     //       ),
//     //     );
//     //     return false;
//     //   }
//     //   if (kebutuhanC.text.isEmpty) {
//     //     showDialog(
//     //       context: context,
//     //       builder: (context) => AlertDialog(
//     //         title: Text('Error'),
//     //         content: Text('Kebutuhan tidak boleh kosong'),
//     //         actions: <Widget>[
//     //           TextButton(
//     //             child: Text('OK'),
//     //             onPressed: () => Navigator.of(context).pop(),
//     //           ),
//     //         ],
//     //       ),
//     //     );
//     //     return false;
//     //   }
//     //   if (hargaC.text.isEmpty) {
//     //     showDialog(
//     //       context: context,
//     //       builder: (context) => AlertDialog(
//     //         title: Text('Error'),
//     //         content: Text('Harga tidak boleh kosong'),
//     //         actions: <Widget>[
//     //           TextButton(
//     //             child: Text('OK'),
//     //             onPressed: () => Navigator.of(context).pop(),
//     //           ),
//     //         ],
//     //       ),
//     //     );
//     //     return false;
//     //   }
//     //   return true;
//     // }

//     Container inputSection() {
//       // Widget title() {
//       //   return Container(
//       //     child: Column(
//       //       children: [
//       //         Text(
//       //           'Tambah data sayuran',
//       //           style: blackTextStyle.copyWith(
//       //             fontSize: 16,
//       //             fontWeight: semiBold,
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   );
//       // }

//       return Container(
//         margin: EdgeInsets.only(top: 22),
//         padding: const EdgeInsets.symmetric(
//           horizontal: 10,
//           vertical: 5,
//         ),
//         decoration: BoxDecoration(
//           color: kPrimaryColor,
//           borderRadius: BorderRadius.circular(defaultRadius),
//         ),
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               // title(),
//               CustomTextFromField(
//                 controller: namaC,
//                 title: 'Nama Pangan',
//                 hintText: 'Masukan nama pangan',
//                 validator: (value) {
//                   return value == null || value.isEmpty
//                       ? "nama pangan tidak boleh kosong"
//                       : null;
//                 },
//               ),
//               CustomTextFromField(
//                 controller: ketersediaanC,
//                 title: 'Ketersediaan',
//                 hintText: 'Masukan jumlah ketersediaan',
//               ),
//               CustomTextFromField(
//                 controller: kebutuhanC,
//                 title: 'Kebutuhan',
//                 hintText: 'Masukan jumlah kebutuhan',
//               ),
//               CustomTextFromField(
//                 controller: hargaC,
//                 title: 'Harga',
//                 hintText: 'Masukan jumlah harga ',
//               ),
//               CustomButton(
//                 width: MediaQuery.of(context).size.width,
//                 title: 'Simpan',
//                 textStyle: whiteTextStyle.copyWith(
//                   fontSize: 16,
//                   fontWeight: semiBold,
//                 ),
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     // print(arguments['jenis_pangan_id']);
//                   }

//                   // if (validateInputs()) {
//                   //   store();
//                   // }
//                 },
//               ),
//               SizedBox(height: 10),
//               CustomButton(
//                 title: 'Kirim',
//                 width: MediaQuery.of(context).size.width,
//                 backgroundColor: kOrangeColor,
//                 textStyle: whiteTextStyle.copyWith(
//                   fontSize: 16,
//                   fontWeight: semiBold,
//                 ),
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     Navigator.pushNamed(context, '/kirimdataberhasil');
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         centerTitle: true, // Menengahkan judul
//         title: Text(
//           'Tambah Data',
//           style: blackTextStyle.copyWith(
//             fontSize: 18,
//             fontWeight: semiBold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             inputSection(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:apk/models/subjenis_pangan_model.dart';
import 'package:apk/service/preferencesService.dart';
import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahDataPangan extends StatefulWidget {
  const TambahDataPangan({super.key});

  @override
  State<TambahDataPangan> createState() => _TambahDataPanganState();
}

class _TambahDataPanganState extends State<TambahDataPangan> {
  var subjenisPanganID;
  TextEditingController persediaanC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Dio _dio = Dio();

  Future<bool> store(int jId, int status) async {
    var data = {
      'user_id': PreferencesService().getId(),
      'pasar_id': PreferencesService().getPasarId(),
      'jenis_pangan_id': jId.toString(),
      'subjenis_pangan_id': subjenisPanganID.toString(),
      'stok': persediaanC.text,
      'harga': hargaC.text,
      'date': getCurrentDateFormatted(),
      'status': status,
    };

    print(data);

    try {
      Response response = await _dio.post(
        'https://sintrenayu.com/api/pangan/store', // Ganti dengan URL endpoint API Anda
        data: data,
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data berhasil disimpan');
        if (status == 0) {
          Navigator.pushNamed(context, '/draftdata');
        } else {
          Navigator.pushNamed(context, '/riwayatdataterkirim');
        }
        return true; // Operasi berhasil
      } else {
        print('Gagal menyimpan data');
        return false; // Operasi gagal
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
      return false; // Operasi gagal
    }
  }

  String getCurrentDateFormatted() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Tambah Data Pangan")),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subjenis Pangan',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 5),
                DropdownSearch<SubjenisPangan>(
                  itemAsString: (SubjenisPangan? item) => item?.name ?? '',
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Masukan nama pangan",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: kGreyColor,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    ),
                  ),
                  asyncItems: (String filter) async {
                    var response = await Dio().get(
                      "https://sintrenayu.com/api/pangan/subjenis_pangan/${arguments!['jenis_pangan_id']}",
                    );
                    var models = SubjenisPangan.fromJsonList(
                        response.data['subjenis_pangan']);
                    return models;
                  },
                  onChanged: (SubjenisPangan? data) {
                    subjenisPanganID = data!.id;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFromField(
                  controller: persediaanC,
                  title: 'Persediaan',
                  hintText: 'Masukan jumlah ketersediaan',
                  validator: (value) {
                    return value!.isEmpty
                        ? "Persediaan tidak boleh kosong"
                        : null;
                  },
                ),
                CustomTextFromField(
                  controller: hargaC,
                  title: 'Harga',
                  hintText: 'Masukan jumlah harga',
                  validator: (value) {
                    return value!.isEmpty ? "Harga tidak boleh kosong" : null;
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  title: 'Simpan',
                  textStyle: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      store(arguments!['jenis_pangan_id'], 0).then((success) {
                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data berhasil disimpan sebagai draft')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Gagal menyimpan data sebagai draft')),
                          );
                        }
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  title: 'Kirim',
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: kOrangeColor,
                  textStyle: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      store(arguments!['jenis_pangan_id'], 1).then((success) {
                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data berhasil terkirim')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Gagal mengirim data')),
                          );
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
