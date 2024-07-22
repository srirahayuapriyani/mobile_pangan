import 'package:apk/shared/theme.dart';
import 'package:apk/ui/pages/daftar_pangan.dart';
import 'package:flutter/material.dart';

class Layanan extends StatelessWidget {
  const Layanan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget daftarPangan(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10), // Menambahkan jarak horizontal
              width: MediaQuery.of(context).size.width - 20,
              height: 142,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/bg.png',
                  ),
                  fit: BoxFit
                      .cover, // tambahkan jika Anda ingin gambar diisi ke dalam container
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    15), // Menambahkan jarak atas, bawah, kiri, dan kanan dalam gambar
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daftar Pangan",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Daftar data komoditi yang bisa di isi",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: reguler,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Tambahkan jarak antara teks dan tombol
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/daftarpangan');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              kWhiteColor, // Warna latar belakang tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Lihat',
                          style: blueTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget draftDataPanganTersimpan(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10), // Menambahkan jarak horizontal
              width: MediaQuery.of(context).size.width - 20,
              height: 142,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/bg2.png',
                  ),
                  fit: BoxFit
                      .cover, // tambahkan jika Anda ingin gambar diisi ke dalam container
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    15), // Menambahkan jarak atas, bawah, kiri, dan kanan dalam gambar
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Draft Data",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Draft data pangan yang bisa dilihat",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: reguler,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Tambahkan jarak antara teks dan tombol
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/draftdata');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              kWhiteColor, // Warna latar belakang tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Lihat',
                          style: blueTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

        Widget draftDataPanganTerkirim(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10), // Menambahkan jarak horizontal
              width: MediaQuery.of(context).size.width - 20,
              height: 142,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/bg3.png',
                  ),
                  fit: BoxFit
                      .cover, // tambahkan jika Anda ingin gambar diisi ke dalam container
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    15), // Menambahkan jarak atas, bawah, kiri, dan kanan dalam gambar
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riwayat Data",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Riwayat data pangan yang bisa dilihat",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: reguler,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Tambahkan jarak antara teks dan tombol
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/riwayatdataterkirim');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              kWhiteColor, // Warna latar belakang tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Lihat',
                          style: blueTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

  Widget grafikData(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10), // Menambahkan jarak horizontal
              width: MediaQuery.of(context).size.width - 20,
              height: 142,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/bg3.png',
                  ),
                  fit: BoxFit
                      .cover, // tambahkan jika Anda ingin gambar diisi ke dalam container
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    15), // Menambahkan jarak atas, bawah, kiri, dan kanan dalam gambar
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Grafik Data",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Riwayat data pangan yang bisa dilihat",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: reguler,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Tambahkan jarak antara teks dan tombol
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/riwayatdataterkirim');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              kWhiteColor, // Warna latar belakang tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Lihat',
                          style: blueTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    Widget grafik(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10), // Menambahkan jarak horizontal
              width: MediaQuery.of(context).size.width - 20,
              height: 142,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(5),
              //   image: const DecorationImage(
              //     image: AssetImage(
              //       'assets/bg3.png',
              //     ),
              //     fit: BoxFit
              //         .cover, // tambahkan jika Anda ingin gambar diisi ke dalam container
              //   ),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(
                    15), // Menambahkan jarak atas, bawah, kiri, dan kanan dalam gambar
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Grafik Data",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Riwayat data pangan yang bisa dilihat",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: reguler,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Tambahkan jarak antara teks dan tombol
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, '/riwayatdataterkirim');
                    //     },
                    //     style: TextButton.styleFrom(
                    //       backgroundColor:
                    //           kWhiteColor, // Warna latar belakang tombol
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       'Lihat',
                    //       style: blueTextStyle.copyWith(
                    //         fontSize: 14,
                    //         fontWeight: semiBold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Layanan',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: [
        
          daftarPangan(context),
          draftDataPanganTersimpan(context),
            draftDataPanganTerkirim(context),
            grafikData(context),
              grafik(context),
        ],
      ),
    );
  }
}
