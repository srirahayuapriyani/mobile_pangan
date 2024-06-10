import 'package:apk/cubit/page_cubit.dart';
import 'package:apk/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNav extends StatelessWidget {
  final int index;
  final String imageUrl;

  const CustomBottomNav({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: BlocBuilder<PageCubit, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                width: 34,
                height: 34,
                color: state == index ? kWhiteColor : kGreyColor,
              ),
              SizedBox(height: 4), // Jarak antara ikon dan teks
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: state == index ? kWhiteColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
