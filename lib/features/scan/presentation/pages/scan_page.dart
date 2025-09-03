import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  File? _image;
  final picker = ImagePicker();

  void _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    }
  }

  void _takeImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Scan atau upload struk belanja',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppPallete.baseWhite,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
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
                  onTap: () {
                    _takeImage();
                  },
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
                  onTap: () {
                    _pickImage();
                  },
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
          ),
        ],
      ),
    );
  }
}
