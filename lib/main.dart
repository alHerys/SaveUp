import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/asisten/presentation/pages/asisten_page.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';
import 'package:save_up/features/onboarding/presentation/pages/onboarding/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppPallete.secondary,
          brightness: Brightness.light
        ),
      ),
      initialRoute: '/asisten',
      routes: {
        '/' : (context) => const OnboardingPage(),
        '/home' : (context) => const HomePage(),
        '/asisten' : (context) => const AsistenPage(),
      },
    );
  }
}