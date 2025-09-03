import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/home/presentation/bloc/home_bloc.dart';

class Navbar extends StatefulWidget {
  final int tabIndex;

  const Navbar({super.key, required this.tabIndex});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<NavbarItem> navItems = [
    NavbarItem(
      icon: 'assets/icons/Home Nav Inactive.svg',
      activeIcon: 'assets/icons/Home Nav Active.svg',
      label: 'Track',
    ),
    NavbarItem(
      icon: 'assets/icons/Scan Nav Inactive.svg',
      activeIcon: 'assets/icons/Scan Nav Active.svg',
      label: 'Scan',
    ),
    NavbarItem(
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

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (widget.tabIndex != index) {
      _animationController.reset();
      _animationController.forward();
      context.read<HomeBloc>().add(TabChange(tabIndex: index));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppPallete.primary, // AppPallete.primary
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background putih yang bergeser
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutQuad,
                left: _calculateBackgroundPosition(),
                top: 8,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 12, top: 1),
                  width: 56,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              );
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: navItems.asMap().entries.map((entry) {
              int index = entry.key;
              NavbarItem item = entry.value;
              bool isSelected = widget.tabIndex == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      AnimatedScale(
                        scale: 1,
                        duration: const Duration(milliseconds: 400),
                        child: SvgPicture.asset(
                          isSelected ? item.activeIcon : item.icon,
                          width: 22,
                          colorFilter: ColorFilter.mode(
                            isSelected
                                ? AppPallete.primary
                                : AppPallete.navbarInactive,
                            BlendMode.srcIn,
                          ),
                          // Tambahkan error handling
                          placeholderBuilder: (context) => Icon(
                            Icons.home,
                            size: 22,
                            color: isSelected
                                ? AppPallete.primary
                                : AppPallete.navbarInactive,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? AppPallete.baseWhite
                              : AppPallete.navbarInactive,
                        ),
                        child: Text(item.label),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  double _calculateBackgroundPosition() {
    try {
      final screenWidth = MediaQuery.of(context).size.width;
      final navbarWidth = screenWidth - 48;
      final itemWidth = navbarWidth / navItems.length;
      final backgroundOffset = (itemWidth - 80) / 2;

      return (itemWidth * widget.tabIndex) + backgroundOffset;
    } catch (e) {
      // Fallback jika ada error
      return 0.0;
    }
  }
}

class NavbarItem {
  final String icon;
  final String activeIcon;
  final String label;

  NavbarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
