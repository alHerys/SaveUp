import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/asisten/presentation/pages/asisten_page.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';
import 'package:save_up/features/onboarding/presentation/pages/onboarding/onboarding_page.dart';
import 'package:save_up/navigation_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppPallete.baseWhite,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(textTheme),
      ),
      initialRoute: '/home',
      onGenerateRoute: NavigationRoutes().generateRoute,
    );
  }
}
