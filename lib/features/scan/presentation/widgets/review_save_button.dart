// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class ReviewSaveButton extends StatelessWidget {
  final VoidCallback onTap;
  const ReviewSaveButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      top: false,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 21),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppPallete.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Simpan',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppPallete.baseWhite /* White */,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
