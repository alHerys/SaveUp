import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(Icons.arrow_back_ios),
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
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
      bottomNavigationBar: ReviewSafeButton(onTap: () {
        Navigator.pushNamed(context, '/transaksi-terkini');
      }),
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
