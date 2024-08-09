import 'package:apk/models/subjenis_pangan_model.dart';
import 'package:apk/ui/widgets/custom_button.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:apk/service/preferencesService.dart'; // Sesuaikan path service PreferencesService
import 'package:apk/shared/theme.dart'; // Sesuaikan path theme jika berbeda
import 'package:apk/ui/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart'; // Sesuaikan path widget jika berbeda

class EditData extends StatefulWidget {
  const EditData({Key? key}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final _formKey = GlobalKey<FormState>(); // Tambahkan key untuk form
  var subjenisPanganID;
  TextEditingController persediaanController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<bool> update(String id, int status) async {
    var data = {
      'subjenis_pangan_id': subjenisPanganID.toString(),
      'stok': persediaanController.text,
      'harga': hargaController.text,
      'status': status,
      '_method': 'put',
    };
    print("Data yang akan dikirim: $data");

    try {
      Response response = await _dio.post(
        'https://sintrenayu.com/api/pangan/update/$id',
        data: data,
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (status == 0) {
          Navigator.pushReplacementNamed(context, '/draftdata');
        } else {
          Navigator.pushReplacementNamed(context, '/riwayatdataterkirim');
        }
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
      return false;
    }
  }

  Future<void> _initializeData() async {
    // Load initial data if needed
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final id = arguments?['id'];

    setState(() {
      subjenisPanganID = arguments?['subjenis_pangan_id'].toString();
      persediaanController.text = arguments!['persediaan'].toString();
      hargaController.text = arguments['harga'].toString();
    });

    Widget namapasar() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey, // Tambahkan key untuk form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              DropdownSearch<SubjenisPangan>(
                selectedItem: arguments!['subjenis_pangan'],
                itemAsString: (SubjenisPangan? item) => item?.name ?? '',
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Masukan nama pangan",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: kGreyColor),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  ),
                ),
                popupProps: const PopupProps.bottomSheet(
                  showSelectedItems: true,
                ),
                compareFn: (item1, item2) => item1.id == item2.id,
                asyncItems: (String filter) async {
                  var response = await Dio().get(
                    "https://sintrenayu.com/api/pangan/subjenis_pangan/${arguments['jenis_pangan_id']}",
                  );
                  var models = SubjenisPangan.fromJsonList(
                      response.data['subjenis_pangan']);
                  return models;
                },
                onChanged: (SubjenisPangan? data) {
                  subjenisPanganID = data?.id;
                },
              ),
              SizedBox(height: 10),
              CustomTextFromField(
                controller: persediaanController,
                title: 'Persediaan',
                hintText: 'Masukan Ketersediaan',
                validator: (value) {
                  return value!.isEmpty ? "Persediaan tidak boleh kosong" : null;
                },
              ),
              CustomTextFromField(
                controller: hargaController,
                title: 'Harga',
                hintText: 'Masukan harga',
                validator: (value) {
                  return value!.isEmpty ? "Harga tidak boleh kosong" : null;
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                title: 'Kirim Data',
                width: MediaQuery.of(context).size.width,
                backgroundColor: kOrangeColor,
                textStyle: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
                onPressed: () {
                  if (_formKey.currentState!.validate()) { // Periksa validasi form
                    update(id!, 1).then((success) {
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Data berhasil terkirim')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Gagal mengirim data')),
                        );
                      }
                    });
                  }
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                title: 'Simpan Data',
                width: MediaQuery.of(context).size.width,
                textStyle: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
                onPressed: () {
                  if (_formKey.currentState!.validate()) { // Periksa validasi form
                    update(id!, 0).then((success) {
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Data berhasil disimpan sebagai draft')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Gagal menyimpan data sebagai draft')),
                        );
                      }
                    });
                  }
                },
              ),
              
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Data',
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            namapasar(),
          ],
        ),
      ),
    );
  }
}
