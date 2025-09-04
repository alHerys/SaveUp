import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/asisten/presentation/pages/asisten_page.dart';
import 'package:save_up/features/home/presentation/cubit/home_cubit.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';
import 'package:save_up/features/home/presentation/pages/transaksi_terkini_page.dart';
import 'package:save_up/features/home/presentation/widgets/navbar.dart';
import 'package:save_up/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:save_up/features/scan/presentation/cubit_review/review_cubit.dart';
import 'package:save_up/features/scan/presentation/cubit_scan/scan_cubit.dart';
import 'package:save_up/features/scan/presentation/pages/review_page.dart';
import 'package:save_up/features/scan/presentation/pages/scan_page.dart';
import 'package:save_up/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ScanCubit()),
        BlocProvider(create: (context) => ReviewCubit()),
      ],
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
          // '/review': (context) => const ReviewPage(),
          '/transaksi-terkini': (context) => const TransaksiTerkiniPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/review') {
            final imageFile = settings.arguments as File;
            return MaterialPageRoute(
              builder: (context) {
                return ReviewPage(imageFile: imageFile);
              },
            );
          }
          return null; // Penting untuk rute lainnya
        },
      ),
    );
  }
}

final List<Widget> mainPageList = [
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
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
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
                      context.read<HomeCubit>().changeTab(0);
                    },
                  ),
                ),
          body: mainPageList.elementAt(state.tabIndex),
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
