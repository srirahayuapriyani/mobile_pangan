import 'package:apk/shared/theme.dart';
import 'package:apk/ui/pages/detail_data.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DraftRiwayatData extends StatelessWidget {
  final String title1;
  final String title2;
  // final String title3;
  final String title4;
  final valueText1;
  final valueText2;
  // final valueText3;
  final valueText4;

  const DraftRiwayatData({
    Key? key,
    required this.title1,
    required this.title2,
    // required this.title3,
    required this.title4,
    required this.valueText1,
    required this.valueText2,
    // required this.valueText3,
    required this.valueText4,
  }) : super(key: key);

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
                  title: 'Sab, 20 April 2024',
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
                Row(
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
                            '/ubahdata'); // Aksi yang ingin dilakukan ketika tombol ditekan
                      },
                      backgroundColor: kBlueColor2,
                      borderRadius: 5,
                    ),
                    Spacer(),
                    CustomButton(
                      width: 140,
                      height: 39, // Panggil CustomButton di sini
                      title: 'Kirim',
                      textStyle: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context,
                            '/kirimdataberhasil'); // Aksi yang ingin dilakukan ketika tombol ditekan
                      },
                      backgroundColor: kOrangeColor,
                      borderRadius: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
