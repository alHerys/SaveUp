import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/home/presentation/widgets/navbar.dart';

class AsistenPage extends StatefulWidget {
  const AsistenPage({super.key});

  @override
  State<AsistenPage> createState() => _AsistenPageState();
}

class _AsistenPageState extends State<AsistenPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 48,
              ),
              child: Center(
                child: Column(
                  spacing: 88,
                  children: [
                    Column(
                      spacing: 3,
                      children: [
                        Text(
                          'Budgie',
                          style: TextStyle(
                            color: AppPallete.primary /* Main-Color */,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Pencatat Keuangan',
                          style: TextStyle(
                            color: AppPallete.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset('assets/images/Chat Bot Onb.svg'),
                    Text(
                      'asisten AI kamu yang siap mencatat setiap transaksi. Cukup sebutkan pengeluaranmu, dan aku akan langsung menyimpannya di sistem.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppPallete.textPrimary /* Text-Primary-text */,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 364,
                      height: 56,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppPallete.primary),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Catat lewat Budgie',
                            style: TextStyle(
                              color: AppPallete.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppPallete.primary,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/paper-airplane.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Navbar(selectedIndex: _selectedIndex, onTap: _onItemTapped),
          ],
        ),
      ),
    );
  }
}
