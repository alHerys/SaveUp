import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/home/presentation/widgets/home_anggaran.dart';
import 'package:save_up/features/home/presentation/widgets/home_laporan.dart';
import 'package:save_up/features/home/presentation/widgets/home_pemasukan_pengeluaran.dart';
import 'package:save_up/features/home/presentation/widgets/home_transaksi_terkini.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final systemNavigationBarHeight = MediaQuery.of(context).padding.bottom;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: AppPallete.primary,
            height: 160 + statusBarHeight,
            child: Padding(
              padding: EdgeInsets.only(
                top: statusBarHeight,
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      color: AppPallete.baseWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'TOTAL SALDO ANDA',
                    style: TextStyle(
                      color: AppPallete.baseWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Text(
                        'Rp',
                        style: TextStyle(
                          color: AppPallete.baseWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '5.100.000',
                        style: TextStyle(
                          color: AppPallete.baseWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 136.27866,
                      height: 25,
                      padding: const EdgeInsets.only(
                        top: 6.21,
                        left: 9.32,
                        right: 12.43,
                        bottom: 6.21,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppPallete.baseWhite,
                      ),
                      child: Row(
                        spacing: 3.11,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/Plus.svg'),
                          Text(
                            'Tambah Buku',
                            style: TextStyle(
                              color: AppPallete.primary /* Main-Color */,
                              fontSize: 9.32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    
          Container(
            margin: EdgeInsets.only(
              top: 140 + statusBarHeight,
              bottom: systemNavigationBarHeight + 100,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              spacing: 20,
              children: [
                HomePemasukanPengeluaran(),
    
                HomeTransaksiTerkini(),
    
                HomeAnggaran(),
    
                HomeLaporan(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
