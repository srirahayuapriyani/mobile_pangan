import 'package:apk/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {

  final String? title;
  final String hintText;
  final bool obscureText;
    final InputDecoration? decoration; 
  final Widget? prefixIcon;
  final TextEditingController? controller;
  

const CustomTextFromField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.decoration,// Tambahkan tanda '?' agar dekorasi menjadi opsional
    this.prefixIcon, this.controller, // Tambahkan tanda '?' agar prefixIcon menjadi opsional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               if (title != null && title!.isNotEmpty) // Periksa apakah title tidak null dan tidak kosong
            Text(
              title!,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: controller,
                cursorColor: kBlackColor,
                obscureText: obscureText,
                style: TextStyle(
                  fontSize: 14,
                  color: kBlackColor,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: reguler,
                  ),

                  fillColor: kWhiteColor, // Ubah warna fill (isi) dari kotak form di sini
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
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12), 
                  prefixIcon: prefixIcon,// Atur ukuran kotak form di sini
                ),
              ),
            ],
          ),
        );
  }
}
