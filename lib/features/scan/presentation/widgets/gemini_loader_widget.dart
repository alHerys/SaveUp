// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/themes/loader.dart';
import 'package:save_up/features/scan/presentation/pages/review_page.dart';

class GeminiLoaderWidget extends StatelessWidget {
  const GeminiLoaderWidget({super.key, required this.widget});

  final ReviewPage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        leading: Icon(Icons.close, color: AppPallete.baseWhite),
      ),
      body: Center(
        child: Stack(
          children: [
            Image.file(
              widget.imageFile,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.8)),
            ),
            Text(
              'Scan atau upload struk belanja',
              style: TextStyle(
                color: AppPallete.baseBlack,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Loader(
                message: 'Mengubah screenshot mu menjadi catatan otomatis',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
