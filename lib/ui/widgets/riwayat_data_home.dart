import 'package:apk/shared/theme.dart';
import 'package:apk/ui/pages/draft_data.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RiwayatDataHome extends StatelessWidget {
  final String alamat;

  const RiwayatDataHome({
    Key? key,
    required this.alamat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DraftData(),
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
                  title: 'Sab, 20 april 2024',
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
                      alamat,
                      style: semiblackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: reguler,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
