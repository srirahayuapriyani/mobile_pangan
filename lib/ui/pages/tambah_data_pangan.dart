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

import 'package:apk/shared/theme.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahDataPangan extends StatefulWidget {
  const TambahDataPangan({super.key});

  @override
  State<TambahDataPangan> createState() => _TambahDataPanganState();
}

class _TambahDataPanganState extends State<TambahDataPangan> {
  TextEditingController namapanganC = TextEditingController();
  TextEditingController persediaanC = TextEditingController();
  // TextEditingController kebutuhanC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> store() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'nama': namapanganC.text,
      'ketersediaan': persediaanC.text,
      // 'kebutuhan': kebutuhanC.text,
      'harga': hargaC.text,
      'tanggal': DateFormat.yMMMMEEEEd().add_jm().format(DateTime.now()),
    };
    // print(arguments['jenis_pangan_id']);
    // print(data.toString());
    List<String> dataList = prefs.getStringList('data_pangan') ?? [];
    dataList.add(jsonEncode(data));
    await prefs.setStringList('data_pangan', dataList);

    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Tambah Data Pangan")),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomTextFromField(
                  controller: namapanganC,
                  title: 'Nama Pangan',
                  hintText: 'Masukan nama pangan',
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "nama pangan tidak boleh kosong"
                        : null;
                  },
                ),
                CustomTextFromField(
                  controller: persediaanC,
                  title: 'persediaan',
                  hintText: 'Masukan jumlah ketersediaan',
                ),
                // CustomTextFromField(
                //   controller: kebutuhanC,
                //   title: 'Kebutuhan',
                //   hintText: 'Masukan jumlah kebutuhan',
                // ),
                CustomTextFromField(
                  controller: hargaC,
                  title: 'Harga',
                  hintText: 'Masukan jumlah harga ',
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  title: 'Simpan',
                  textStyle: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/draftdata');
                      // print(arguments['jenis_pangan_id']);
                      store();
                    }

                    // if (validateInputs()) {
                    // }
                  },
                ),
                SizedBox(height: 10),
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
                      Navigator.pushNamed(context, '/kirimdataberhasil');
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
