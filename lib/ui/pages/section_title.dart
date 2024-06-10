import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
    required this.style, // Menambahkan parameter style untuk mengatur gaya teks
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;
  final TextStyle style; // Menambahkan deklarasi parameter style

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style, // Menggunakan gaya teks yang diberikan
        ),
        TextButton(
          onPressed: press,
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          child: const Text("Lihat Semua"),
        ),
      ],
    );
  }
}
