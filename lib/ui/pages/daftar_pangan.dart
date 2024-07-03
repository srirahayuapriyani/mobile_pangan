import 'package:apk/models/jenis_pangan_model.dart';
import 'package:apk/service/jenis_pangan_service.dart';
import 'package:apk/ui/pages/tambah_data_pangan.dart';
import 'package:flutter/material.dart';
import 'package:apk/shared/theme.dart';

class DaftarPangan extends StatefulWidget {
  const DaftarPangan({Key? key}) : super(key: key);

  @override
  State<DaftarPangan> createState() => _DaftarPanganState();
}

class _DaftarPanganState extends State<DaftarPangan> {
  List<JenisPangan>? jenisPangan; 
  bool isLoading = false;

  // void _fetchDataById(int id) {
  //   JenisPanganService().fetchJenisPanganById(id).then((jenisPangan) {
  //     // Lakukan sesuatu dengan data jenis pangan yang didapat, misalnya tampilkan di UI
  //     print('Data jenis pangan: ${jenisPangan.name}');
  //     // Selanjutnya, Anda bisa melakukan navigasi ke halaman lain atau menampilkan data di UI
  //   }).catchError((error) {
  //     print('Gagal mengambil data jenis pangan: $error');
  //   });
  // }

  @override
  void initState() {
    fetchJenisPangan();
    super.initState();
  }

  void fetchJenisPangan() async{
    isLoading = true;
    jenisPangan =  await JenisPanganService().fetchJenisPangan();
    setState(() {
      isLoading = false;
    });
  }

  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Pangan',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Container(
    margin: EdgeInsets.only(top: 25),
    color: kPrimaryColor,
    child: isLoading
        ? Center(child: CircularProgressIndicator()) // Tampilkan indicator loading jika sedang memuat data
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: jenisPangan?.map((jenis) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/tambahdatapangan', arguments: {'jenis_pangan_id': jenis.id});
                  },
                  child: _buildImage("assets/${jenis.name}.png"),
                ),
              );
            }).toList() ?? [],
          ),
  ),
),

    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
