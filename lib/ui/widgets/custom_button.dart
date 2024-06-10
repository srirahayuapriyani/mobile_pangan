import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apk/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Function() onPressed;
  final EdgeInsets margin;
  final Color? backgroundColor;
  final double borderRadius;
  final TextStyle textStyle;
  final String? iconAssetPath; // Menambahkan properti untuk ikon SVG

  const CustomButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 44,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.borderRadius = 5,
    required this.textStyle,
    this.iconAssetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? kBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconAssetPath != null)
              SvgPicture.asset(
                iconAssetPath!,
                width: 20, // Atur lebar ikon SVG sesuai kebutuhan
                height: 20, // Atur tinggi ikon SVG sesuai kebutuhan
              ), // Tampilkan ikon SVG jika tersedia
            if (iconAssetPath != null) // Berikan jarak jika ada ikon SVG
              SizedBox(width: 3),
            Text(
              title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
