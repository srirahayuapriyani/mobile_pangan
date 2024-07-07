import 'package:apk/cubit/page_cubit.dart';
import 'package:apk/service/preferencesService.dart';
import 'package:apk/ui/pages/home_page.dart';
import 'package:apk/ui/pages/layanan.dart';
import 'package:apk/ui/pages/profile.dart';
import 'package:apk/ui/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key, String password = "", String username = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(PreferencesService().isLoggedIn);
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return Layanan();
        case 2:
          return Profile();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 74,
          margin: EdgeInsets.only(bottom: 30, left: 24, right: 24),
          decoration: BoxDecoration(
            color: kBlueColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNav(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBottomNav(
                index: 1,
                imageUrl: 'assets/icon_list.png',
              ),
              CustomBottomNav(
                index: 2,
                imageUrl: 'assets/icon_profile.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
