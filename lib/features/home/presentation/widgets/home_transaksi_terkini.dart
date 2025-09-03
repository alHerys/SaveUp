import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class HomeTransaksiTerkini extends StatelessWidget {
  const HomeTransaksiTerkini({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaksi terkini',
              style: TextStyle(
                color: AppPallete.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Detail',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppPallete.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x140D0A2C),
                blurRadius: 6,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              Column(
                spacing: 8,
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 16,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Food Category.svg',
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  Text(
                                    'Makanan & Minuman',
                                    style: TextStyle(
                                      color: AppPallete.textPrimary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Rabu, 16 April 2025',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppPallete.textSecondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '-Rp20.000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppPallete.semanticRed,
                              fontSize: 12,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      if (index < 3) Divider(thickness: 1),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
