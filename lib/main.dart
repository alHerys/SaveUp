import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/asisten/presentation/pages/asisten_page.dart';
import 'package:save_up/features/home/presentation/bloc/home_bloc.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';
import 'package:save_up/features/home/presentation/widgets/navbar.dart';
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

List<Widget> screenList = [
  const HomePage(),
  const HomePage(),
  const AsistenPage(),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: screenList.elementAt(state.tabIndex),
          bottomNavigationBar: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Navbar(tabIndex: state.tabIndex),
          ),
        );
      },
    );
  }
}
