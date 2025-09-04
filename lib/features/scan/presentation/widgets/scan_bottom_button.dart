import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class ScanBottomButton extends StatelessWidget {
  final VoidCallback onTapScan;
  final VoidCallback onTapUpload;
  const ScanBottomButton({
    super.key,
    required this.onTapScan,
    required this.onTapUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 11, bottom: 45, left: 24, right: 24),
      decoration: BoxDecoration(
        color: AppPallete.baseWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            child: Divider(thickness: 5, color: const Color(0xFF98ADC7)),
          ),
          GestureDetector(
            onTap: onTapScan,
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppPallete.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Scan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppPallete.baseWhite /* White */,
                  fontSize: 12,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTapUpload,
            child: Container(
              margin: const EdgeInsets.only(top: 11),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppPallete.primary),
              ),
              child: Text(
                'Upload Struk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppPallete.primary,
                  fontSize: 12,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
