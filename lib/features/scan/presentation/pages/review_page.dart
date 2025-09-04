import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/themes/loader.dart';
import 'package:save_up/features/scan/presentation/cubit_scan/scan_cubit.dart';

class ReviewPage extends StatefulWidget {
  final File imageFile;
  const ReviewPage({super.key, required this.imageFile});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();
    context.read<ScanCubit>().processImageInGemini(widget.imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GeminiProcessingImageLoading) {
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
                  Loader(
                    message: 'Mengubah screenshot mu menjadi catatan otomatis',
                  ),
                ],
              ),
            ),
          );
        }
        if (state is ScanEventFailure) {
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
                state.message,
                style: TextStyle(
                  color: AppPallete.baseBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            title: Text(
              'Review Transaksi',
              style: TextStyle(
                color: AppPallete.baseBlack,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 30.0,
              ),
              child: Column(
                spacing: 16,
                children: List.generate(20, (index) {
                  return Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: TransaksiWidget(
                          categoryIcon: 'assets/icons/Edit.svg',
                          nama: 'Indomie Goreng',
                          kategori: 'Makanan & Minuman',
                          nominal: '36.000',
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          bottomNavigationBar: ReviewSafeButton(
            onTap: () {
              Navigator.pushNamed(context, '/transaksi-terkini');
            },
          ),
        );
      },
    );
  }
}

class ReviewSafeButton extends StatelessWidget {
  final VoidCallback onTap;
  const ReviewSafeButton({super.key, required this.onTap});

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

class TransaksiWidget extends StatelessWidget {
  final String categoryIcon;
  final String nama;
  final String kategori;
  final String nominal;
  const TransaksiWidget({
    super.key,
    required this.categoryIcon,
    required this.nama,
    required this.kategori,
    required this.nominal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFD3D3D3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 16,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/Edit.svg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: TextStyle(
                      color: AppPallete.baseBlack,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    kategori,
                    style: TextStyle(
                      color: AppPallete.baseBlack,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '- Rp$nominal',
            style: TextStyle(
              color: const Color(0xFFFF0000),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
