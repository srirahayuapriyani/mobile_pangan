import 'package:apk/cubit/page_cubit.dart';
import 'package:apk/service/preferencesService.dart';
import 'package:apk/ui/pages/daftar_pangan.dart';
import 'package:apk/ui/pages/detail_data.dart';
import 'package:apk/ui/pages/riwayat_data_terkirim.dart';
import 'package:apk/ui/pages/edit_data.dart';
import 'package:apk/ui/pages/kirim_data_berhasil.dart';
import 'package:apk/ui/pages/layanan.dart';
import 'package:apk/ui/pages/draft_data.dart';
import 'package:apk/ui/pages/profile.dart';
import 'package:apk/ui/pages/tambah_data_pangan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'ui/pages/login.dart';
import 'ui/pages/main_page.dart';
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  await PreferencesService().init();
  bool isLoggedIn = PreferencesService().isLoggedIn;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isLoggedIn);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedIn ? '/main' : '/login',
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => Login(),
          '/main': (context) => MainPage(),
          'layanan': (context) => Layanan(),
          '/daftarpangan': (context) => DaftarPangan(),
          '/detaildata': (context) => DetailData(),
          '/editdata': (context) => EditData(),
          '/draftdata': (context) => DraftData(),
          '/tambahdatapangan': (context) => TambahDataPangan(),
          '/kirimdataberhasil': (context) => KirimDataBerhasil(),
          '/layanan': (context) => Layanan(),
          '/profile': (context) => Profile(),
          '/riwayatdataterkirim': (context) => RiwayatDataTerkirim(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/main') {
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) {
                return MainPage(
                  username: args['username']!,
                  password: args['password']!,
                );
              },
            );
          } else if (settings.name == '/profile') {
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) {
                return Profile(
                  username: args['username']!,
                  password: args['password']!,
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
