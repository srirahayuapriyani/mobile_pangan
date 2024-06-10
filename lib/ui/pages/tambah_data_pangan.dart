import 'package:apk/ui/widgets/custom_button.dart';
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class TambahDataPangan extends StatelessWidget {
  const TambahDataPangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController namaC = TextEditingController();
    TextEditingController ketersediaanC = TextEditingController();
    TextEditingController kebutuhanC = TextEditingController();
    TextEditingController hargaC = TextEditingController();

    Future<void> store() async {
      var data = {
        'nama': namaC.text,
        'ketersediaan': ketersediaanC.text,
        'kebutuhan': kebutuhanC.text,
        'harga': hargaC.text,
      };
      print(data);
    }

    Widget inputSection() {
      Widget title() {
        return Container(
          child: Column(
            children: [
              Text(
                'Tambah data sayuran',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        );
      }

      Widget nama() {
        return CustomTextFromField(
          controller: namaC,
          title: 'Nama',
          hintText: 'Masukan nama pangan',
        );
      }

      Widget ketersediaan() {
        return CustomTextFromField(
          controller: ketersediaanC,
          title: 'Ketersediaan',
          hintText: 'Masukan jumlah ketersediaan',
        );
      }

      Widget kebutuhan() {
        return CustomTextFromField(
          controller: kebutuhanC,
          title: 'Kebutuhan',
          hintText: 'Masukan jumlah kebutuhan',
        );
      }

      Widget harga() {
        return CustomTextFromField(
          controller: hargaC,
          title: 'Harga',
          hintText: 'Masukan jumlah harga ',
        );
      }

      Widget simpanButton() {
        return CustomButton(
          width: MediaQuery.of(context).size.width,
          title: 'Simpan',
          textStyle: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
          onPressed: () {
            // Navigator.pushNamed(context, '/draftdata');
            store();
          },
        );
      }

      Widget kirimButton() {
        return CustomButton(
          title: 'Kirim',
          width:MediaQuery.of(context).size.width,
          backgroundColor: kOrangeColor,
          textStyle: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/kirimdataberhasil');
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 22),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            title(),
            nama(),
            ketersediaan(),
            kebutuhan(),
            harga(),
            simpanButton(),
            SizedBox(height: 10),
            kirimButton(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Menengahkan judul
        title: Text(
          'Tambah Data',
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
            inputSection(),
          ],
        ),
      ),
    );
  }
}
