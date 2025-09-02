import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/home/presentation/widgets/home_anggaran.dart';
import 'package:save_up/features/home/presentation/widgets/navbar.dart';
import 'package:save_up/features/home/presentation/widgets/transaction_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    final statusBarHeight = MediaQuery.of(context).padding.top;
    final systemNavigationBarHeight = MediaQuery.of(context).padding.bottom;

    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          body: SafeArea(
            top: false,
            right: false,
            left: false,
            child: SingleChildScrollView(
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
                                      color:
                                          AppPallete.primary /* Main-Color */,
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
                      bottom: systemNavigationBarHeight + 70,
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
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: systemNavigationBarHeight),
          child: Navbar(onTap: onItemTapped, selectedIndex: selectedIndex),
        ),
      ],
    );
  }
}

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

class HomePemasukanPengeluaran extends StatelessWidget {
  const HomePemasukanPengeluaran({super.key});

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
