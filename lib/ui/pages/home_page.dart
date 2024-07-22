import "package:apk/models/jenis_pangan_model.dart";
import "package:apk/service/jenis_pangan_service.dart";
import "package:apk/shared/theme.dart";
import "package:apk/ui/pages/daftar_pangan.dart";
import "package:apk/ui/widgets/custom_text_form_field.dart";
import "package:apk/ui/widgets/riwayat_data_terkirim.dart.dart";

import "package:flutter/material.dart";

import 'section_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<JenisPangan>? jenisPanganItem;
  bool isLoading = false;

  @override
  void initState() {
    fetchJenisPangan();
    super.initState();
  }

  void fetchJenisPangan() async {
    isLoading = true;
    jenisPanganItem = await JenisPanganService().fetchJenisPangan();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin:
            const EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/image_profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'Selamat datang di\naplikasi pangan',
                    style: semiblackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_menu.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Widget searchField() {
    //   return const Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 10),
    //     child: CustomTextFromField(
    //       title: '',
    //       hintText: 'Cari Pasar',
    //       obscureText: false,
    //       prefixIcon: Icon(Icons.search),
    //     ),
    //   );
    // }

    Widget inputData() {
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
                      "Masukkan data pangan untuk \nmengelola ketersediaan pangan",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Tambahkan jarak antara teks dan tombol
                    Container(
                      // Container untuk membungkus tombol
                      width: 195,
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
                          'Masukan data sekarang',
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

    Widget jenisPangan() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DaftarPangan(),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SectionTitle(
                title: 'Jenis Pangan',
                style: semiblackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
                press: () {
                  Navigator.pushNamed(context, '/daftarpangan');
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: jenisPanganItem?.map((jenis) {
                            return GestureDetector(
                              onTap: () {},
                              child: _buildJenisPanganItem(
                                  '',
                                  "https://sintrenayu.com/storage/${jenis.gambar}",
                                  context),
                            );
                          }).toList() ??
                          [],
                    ),
            ),
          ],
        ),
      );
    }

    Widget riwayatData() {
      return Container(
        margin: const EdgeInsets.only(
            bottom: 100), // Atur margin bawah sesuai kebutuhan Anda
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SectionTitle(
                title: 'Riwayat Data',
                style: semiblackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
                press: () {
                  Navigator.pushNamed(context, '/riwayatdataterkirim');
                },
              ),
            ),
            const RiwayatDataTerkirim(
              alamat:
                  'Bulak, Kec. Jatibarang, Kabupaten\nIndramayu,Jawa Barat 45273',
            ),
            const RiwayatDataTerkirim(
              alamat:
                  'Bulak, Kec. Jatibarang, Kabupaten\nIndramayu,Jawa Barat 45273',
            ),
            const RiwayatDataTerkirim(
              alamat:
                  'Bulak, Kec. Jatibarang, Kabupaten\nIndramayu,Jawa Barat 45273',
            ),
            const RiwayatDataTerkirim(
              alamat:
                  'Bulak, Kec. Jatibarang, Kabupaten\nIndramayu,Jawa Barat 45273',
            ), // Tambahkan widget lain untuk riwayat pasar di sini
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        // searchField(),
        inputData(),
        jenisPangan(),
        riwayatData(),
      ],
    );
  }
}

Widget _buildJenisPanganItem(
    String title, String imagePath, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
        
      ],
    ),
  );
}


