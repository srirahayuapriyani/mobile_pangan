import 'package:apk/models/subjenis_pangan_model.dart';
import 'package:apk/shared/theme.dart';
import 'package:apk/ui/pages/detail_data.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class draftDataPanganTersimpan extends StatelessWidget {
  final String title1;

  final SubjenisPangan? subjenisPangan;
  final String? jenis_pangan_id; 
  final String id;
  bool? isButtonVisible;
  bool status;
  final String title2;
  // final String title3;
  final String title4;
  final valueText1;
  final valueText2;
  // final valueText3;
  final valueText4;
  final VoidCallback? onDelete;

  draftDataPanganTersimpan({
    super.key,
    required this.title1,
    required this.title2,
    // required this.title3,
    required this.title4,
    required this.valueText1,
    required this.valueText2,
    // required this.valueText3,
    required this.valueText4,
    required this.status,
    this.isButtonVisible = true,
    required this.id,
    this.onDelete,  this.jenis_pangan_id,  this.subjenisPangan,
  });

  Future<Response> deleteDataPangan(String id) async {
    try {
      final dio = Dio();
      final response = await dio.delete(
        'https://sintrenayu.com/api/pangan/deleteDetailById/$id',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      // if (response.statusCode != 200) {
      //   throw Exception('Failed to delete data');
      // }
      print(response.data);
      return response;
    } catch (e) {
      print('Error deleting data: $e');
      throw e;
    }
  }

  Future<bool> validateInputs(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Konfirmasi'),
              content: Text('Apakah Anda yakin ingin menghapus data ini?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Return false
                  },
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Return true
                  },
                  child: Text('Ya'),
                ),
              ],
            );
          },
        ) ??
        false; // Return false if the dialog is dismissed
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailData(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  width: 191,
                  height: 35, // Panggil CustomButton di sini
                  title: 'Sab, 20\April 2024',
                  textStyle: blueTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  iconAssetPath: 'assets/CalendarBlank.svg',
                  onPressed: () {
                    // Aksi yang ingin dilakukan ketika tombol ditekan
                  },
                  backgroundColor:
                      kGreenColor, // Atur warna latar belakang sesuai keinginan
                  borderRadius: 30, // Atur nilai border radius sesuai keinginan
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Data Pasar Bangkir',
                      style: blueTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '$title1',
                      style: semiblackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '$valueText1',
                      style: semiblackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '$title2',
                      style: semiblackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '$valueText2',
                      style: semiblackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     // Text(
                //     //   '$title3',
                //     //   style: semiblackTextStyle.copyWith(
                //     //     fontSize: 14,
                //     //     fontWeight: semiBold,
                //     //   ),
                //     // ),
                //     Spacer(),
                //     // Text(
                //     //   '$valueText3',
                //     //   style: semiblackTextStyle.copyWith(
                //     //     fontSize: 14,
                //     //     fontWeight: reguler,
                //     //   ),
                //     // ),
                //   ],
                // ),
                Row(
                  children: [
                    Text(
                      '$title4',
                      style: semiblackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '$valueText4',
                      style: semiblackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                status!
                    ? Text(
                        "Terkirim",
                        style: TextStyle(color: Colors.green),
                      )
                    : SizedBox(),
                isButtonVisible!
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            width: 150,
                            height: 39, // Panggil CustomButton di sini
                            title: 'Edit',
                            textStyle: blueTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  '/editdata', arguments: {'nama':valueText1,'persediaan':valueText2,'harga':valueText4, 'id':id, 'jenis_pangan_id': jenis_pangan_id, 'subjenis_pangan': subjenisPangan, 'subjenis_pangan_id': subjenisPangan!.id}); // Aksi yang ingin dilakukan ketika tombol ditekan
                            },
                            backgroundColor: kBlueColor2,
                            borderRadius: 5,
                          ),
                          Spacer(),
                          CustomButton(
                            width: 140,
                            height: 39, // Panggil CustomButton di sini
                            title: 'Hapus',
                            textStyle: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                        onPressed: () async {
                              bool isConfirmed =
                                  await validateInputs(context);
                              if (isConfirmed) {
                                var response =
                                    await deleteDataPangan(id);
                                if (response.statusCode == 200) {
                                  onDelete?.call(); // Panggil callback onDelete untuk mengaktifkan SnackBar
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Failed to delete data')),
                                  );
                                }
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            backgroundColor: kRedColor,
                            borderRadius: 5,
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}