import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/asisten/presentation/pages/asisten_page.dart';
import 'package:save_up/features/home/presentation/bloc/home_bloc.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';
import 'package:save_up/features/home/presentation/widgets/navbar.dart';
import 'package:save_up/features/onboarding/presentation/pages/onboarding/onboarding_page.dart';
import 'package:save_up/features/scan/presentation/pages/scan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
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
        initialRoute: '/',
        routes: {
          '/': (context) => const OnboardingPage(),
          '/asisten': (context) => const MainPage(),
          '/scan': (context) => const ScanPage(),
          '/home': (context) => const MainPage(),
        },
      ),
    );
  }
}

final List<Widget> screenList = [
  const HomePage(),
  const ScanPage(),
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
          // extendBodyBehindAppBar: true,
          backgroundColor: state.tabIndex != 1 ? null : AppPallete.baseBlack,
          appBar: state.tabIndex != 1
              ? null
              : AppBar(
                  backgroundColor: AppPallete.baseBlack,
                  title: Text(
                    'Scan Struk',
                    style: TextStyle(
                      color: AppPallete.baseWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(Icons.close, color: AppPallete.baseWhite),
                    onPressed: () {
                      context.read<HomeBloc>().add(TabChange(tabIndex: 0));
                    },
                  ),
                ),
          body: screenList.elementAt(state.tabIndex),
          bottomNavigationBar: state.tabIndex != 1
              ? Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  child: Navbar(tabIndex: state.tabIndex),
                )
              : null,
        );
      },
    );
  }
}
