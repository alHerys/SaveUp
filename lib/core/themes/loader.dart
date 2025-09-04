import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';


class Loader extends StatelessWidget {
  final String? message;

  const Loader({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/Loading.svg'),
          Text(
            'Mohon Tunggu',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppPallete.baseWhite,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (message != null) Text(
            message!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppPallete.baseWhite,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ) else SizedBox(),
        ],
      ),
    );
  }
}
