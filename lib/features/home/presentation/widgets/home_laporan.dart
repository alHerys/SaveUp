import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/home/presentation/widgets/transaction_chart.dart';

class HomeLaporan extends StatelessWidget {
  const HomeLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Laporan',
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppPallete.baseWhite,
            boxShadow: [
              BoxShadow(
                color: Color(0x140D0A2C),
                blurRadius: 6,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TransactionChart(),
              Container(
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 17),
                decoration: ShapeDecoration(
                  color: const Color(0xFFC1DCC3) /* Accent */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'Rekomendasi',
                      style: TextStyle(
                        color: AppPallete.textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 17.0,
                  right: 17.0,
                ),
                child: Text(
                  'Pemasukanmu konsisten lebih tinggi dari pengeluaran, tapi hati-hati di April karena ada penurunan signifikan—saatnya evaluasi dan atur strategi keuangan!\n',
                  style: TextStyle(
                    color: const Color(0xFF333333) /* Text-Primary-text */,
                    fontSize: 12,
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
