import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/navigation_routes.dart';

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
          seedColor: AppPallete.baseWhite,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      onGenerateRoute: NavigationRoutes().generateRoute,
    );
  }
}
