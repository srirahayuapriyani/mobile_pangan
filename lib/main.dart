import 'package:apk/cubit/page_cubit.dart';
import 'package:apk/ui/pages/daftar_pangan.dart';
import 'package:apk/ui/pages/detail_data.dart';
import 'package:apk/ui/pages/ubah_data.dart';
import 'package:apk/ui/pages/kirim_data_berhasil.dart';
import 'package:apk/ui/pages/layanan.dart';
import 'package:apk/ui/pages/draft_data.dart';
import 'package:apk/ui/pages/profile.dart';
import 'package:apk/ui/pages/tambah_data_pangan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/pages/login.dart';
import 'ui/pages/main_page.dart';
import 'ui/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => Login(),
          '/main': (context) => MainPage(),
          'layanan': (context) => Layanan(),
          '/daftarpangan': (context) => DaftarPangan(),
          '/detaildata': (context) => DetailData(),
          '/ubahdata': (context) => UbahData(),
          '/draftdata': (context) => DraftData(),
          '/tambahdatapangan': (context) => TambahDataPangan(),
          '/kirimdataberhasil': (context) => KirimDataBerhasil(),
          '/layanan': (context) => Layanan(),
          '/profile': (context) => Profile(),
        },
      ),
    );
  }
}
