// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:save_up/core/themes/app_pallete.dart';

class HomePemasukanPengeluaran extends StatelessWidget {
  final VoidCallback onTapTambahTransaksi;
  const HomePemasukanPengeluaran({
    super.key,
    required this.onTapTambahTransaksi,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 125,
          padding: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Color(0xFFDDFCB8),
            borderRadius: BorderRadius.all(Radius.circular(7.58)),
            boxShadow: [
              BoxShadow(
                color: Color(0x0F101828),
                blurRadius: 3.79,
                offset: Offset(0, 1.90),
                spreadRadius: -1.90,
              ),
              BoxShadow(
                color: Color(0x19101828),
                blurRadius: 7.58,
                offset: Offset(0, 3.79),
                spreadRadius: -1.90,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: onTapTambahTransaksi,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Tambah Transaksi',
                  style: TextStyle(
                    color: AppPallete.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            
                SvgPicture.asset('assets/icons/Tambah Transaksi.svg'),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppPallete.baseWhite,
            borderRadius: BorderRadius.all(Radius.circular(7.58)),
            boxShadow: [
              BoxShadow(
                color: Color(0x0F101828),
                blurRadius: 3.79,
                offset: Offset(0, 1.90),
                spreadRadius: -1.90,
              ),
              BoxShadow(
                color: Color(0x19101828),
                blurRadius: 7.58,
                offset: Offset(0, 3.79),
                spreadRadius: -1.90,
              ),
            ],
          ),
          child: Column(
            spacing: 5.42,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Januari 2024',
                style: TextStyle(
                  color: AppPallete.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 163,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF98ADC7), width: 0.47),
                      borderRadius: BorderRadius.circular(7.58),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 9.64,
                        horizontal: 13.27,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Pemasukan',
                            style: TextStyle(
                              color: AppPallete.textPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            spacing: 10.43,
                            children: [
                              SvgPicture.asset('assets/icons/Pemasukan.svg'),
                              Text('Rp 0'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 163,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF98ADC7), width: 0.47),
                      borderRadius: BorderRadius.circular(7.58),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 9.64,
                        horizontal: 13.27,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Pengeluaran',
                            style: TextStyle(
                              color: AppPallete.textPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            spacing: 10.43,
                            children: [
                              SvgPicture.asset('assets/icons/Pengeluaran.svg'),
                              Text('Rp 0'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
