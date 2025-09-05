import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class ReviewFailureWidget extends StatelessWidget {
  const ReviewFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Scan Struk',
          style: TextStyle(
            color: AppPallete.baseWhite,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: AppPallete.baseWhite),
        ),
      ),
      body: Center(
        child: Text(
          'Terjadi Error',
          style: TextStyle(
            color: AppPallete.baseBlack,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
