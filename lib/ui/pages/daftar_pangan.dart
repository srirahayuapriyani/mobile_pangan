import 'package:flutter/material.dart';
import 'package:apk/models/jenis_pangan_model.dart';
import 'package:apk/service/jenis_pangan_service.dart';
import 'package:apk/ui/pages/tambah_data_pangan.dart';
import 'package:apk/shared/theme.dart';

class DaftarPangan extends StatefulWidget {
  const DaftarPangan({Key? key}) : super(key: key);

  @override
  State<DaftarPangan> createState() => _DaftarPanganState();
}

class _DaftarPanganState extends State<DaftarPangan> {
  List<JenisPangan>? jenisPangan;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchJenisPangan();
  }

  void fetchJenisPangan() async {
    setState(() {
      isLoading = true;
    });
    try {
      jenisPangan = await JenisPanganService().fetchJenisPangan();
    } catch (error) {
      print('Gagal mengambil data jenis pangan: $error');
      // Tambahkan penanganan error sesuai kebutuhan
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Pangan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        color: kPrimaryColor,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.9, // Adjust the aspect ratio as needed
                  ),
                  itemCount: jenisPangan?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/tambahdatapangan',
                          arguments: {
                            'jenis_pangan_id': jenisPangan![index].id
                          },
                        );
                      },
                      child: _buildImage(
                        "https://sintrenayu.com/storage/${jenisPangan![index].gambar}",
                        jenisPangan![index].name,
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }

  Widget _buildImage
  (String imagePath, String data) {
    return Container(
      width: 150, // Adjust the width as needed
      height: 150, // Adjust the height as needed
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10), // Border radius for the main container
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 8, // Adjust the position of the text vertically
              left: 8, // Adjust the position of the text horizontally
              right: 8,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10), // Border radius for the text container
                  color: Colors.black.withOpacity(
                      0.5), // Semi-transparent black background for text
                ),
                child: Text(
                  data,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  maxLines: 2, // Maximum lines of text
                  overflow: TextOverflow.ellipsis, // Text overflow behavior
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
