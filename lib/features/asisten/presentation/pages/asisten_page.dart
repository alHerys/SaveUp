import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/themes/app_text_style.dart';

class AsistenPage extends StatefulWidget {
  const AsistenPage({super.key});

  @override
  State<AsistenPage> createState() => _AsistenPageState();
}

class _AsistenPageState extends State<AsistenPage> {

  int _selectedIndex = 2; // Default ke halaman "Asisten"

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  spacing: 106.43,
                  children: [
                    Column(
                      spacing: 16,
                      children: [
                        Text(
                          'Budgie',
                          style: AppTextStyle.plusJakartaSans20w700.copyWith(
                            color: AppPallete.primary,
                          ),
                        ),
                        Text(
                          'Pencatat Keuangan',
                          style: AppTextStyle.plusJakartaSans20w600.copyWith(
                            color: AppPallete.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset('assets/images/Chat Bot Onb.svg'),
                    Text(
                      'asisten AI kamu yang siap mencatat setiap transaksi. Cukup sebutkan pengeluaranmu, dan aku akan langsung menyimpannya di sistem.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.plusJakartaSans16w400.copyWith(
                        color: AppPallete.textPrimary,
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
                          Text('Catat lewat Budgie'),
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
            // Navbar(),
            AnimatedNavbar(selectedIndex: _selectedIndex, onTap: _onItemTapped),
          ],
        ),
      ),
    );
  }
}

List<String> navIcon = [
  'assets/icons/Home Nav Inactive.svg',
  'assets/icons/Scan Nav Active.svg',
  'assets/icons/Asisten Nav Active.svg',
];

int selectedIndex = 0;

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: navIcon.map((icon) {
            int index = navIcon.indexOf(icon);
            bool isSelected = selectedIndex == index;
            return Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 15,
                      bottom: 0,
                      left: 35,
                      right: 35,
                    ),
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        isSelected ? AppPallete.primary : Color(0xFFD3D3D3),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class AnimatedNavbar extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;
  
  const AnimatedNavbar({
    super.key, 
    required this.onTap,
    this.selectedIndex = 0,
  });

  @override
  State<AnimatedNavbar> createState() => _AnimatedNavbarState();
}

class _AnimatedNavbarState extends State<AnimatedNavbar>
    with TickerProviderStateMixin {
  
  late AnimationController _animationController;
  late Animation<double> _animation;

  // Daftar icon untuk navbar
  final List<NavItem> navItems = [
    NavItem(
      icon: 'assets/icons/Home Nav Inactive.svg',
      activeIcon: 'assets/icons/Home Nav Active.svg',
      label: 'Track',
    ),
    NavItem(
      icon: 'assets/icons/Scan Nav Inactive.svg', 
      activeIcon: 'assets/icons/Scan Nav Active.svg',
      label: 'Scan',
    ),
    NavItem(
      icon: 'assets/icons/Asisten Nav Inactive.svg',
      activeIcon: 'assets/icons/Asisten Nav Active.svg', 
      label: 'Asisten',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (widget.selectedIndex != index) {
      _animationController.reset();
      _animationController.forward();
      widget.onTap(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
        decoration: BoxDecoration(
          color: AppPallete.primary, // AppPallete.primary
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background putih yang bergeser
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: _calculateBackgroundPosition(),
                  top: 8,
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
            
            // Items navbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: navItems.asMap().entries.map((entry) {
                int index = entry.key;
                NavItem item = entry.value;
                bool isSelected = widget.selectedIndex == index;
                
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onItemTapped(index),
                    child: SizedBox(
                      height: 65,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedScale(
                            scale: isSelected ? 1.1 : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: SvgPicture.asset(
                              isSelected ? item.activeIcon : item.icon,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                isSelected 
                                  ? AppPallete.primary 
                                  : AppPallete.navbarInactive,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              fontSize: isSelected ? 12 : 10,
                              fontWeight: isSelected 
                                ? FontWeight.w600 
                                : FontWeight.w400,
                              color: isSelected 
                                ? AppPallete.primary
                                : AppPallete.navbarInactive,
                            ),
                            child: Text(item.label),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateBackgroundPosition() {
    // Menghitung posisi background putih berdasarkan item yang dipilih
    final screenWidth = MediaQuery.of(context).size.width;
    final navbarWidth = screenWidth - 48; // margin kiri + kanan
    final itemWidth = navbarWidth / navItems.length;
    final backgroundOffset = (itemWidth - 80) / 2; // 80 adalah lebar background
    
    return (itemWidth * widget.selectedIndex) + backgroundOffset;
  }
}

// Model untuk item navbar
class NavItem {
  final String icon;
  final String activeIcon;
  final String label;

  NavItem({
    required this.icon,
    required this.activeIcon, 
    required this.label,
  });
}