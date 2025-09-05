import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/asisten/presentation/pages/asisten_page.dart';
import 'package:save_up/features/home/presentation/cubit/navbar/navbar_cubit.dart';
import 'package:save_up/features/home/presentation/cubit/transaction/transaction_cubit.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';
import 'package:save_up/features/home/presentation/pages/transaksi_terkini_page.dart';
import 'package:save_up/features/home/presentation/widgets/navbar.dart';
import 'package:save_up/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:save_up/features/scan/presentation/cubit/review/review_cubit.dart';
import 'package:save_up/features/scan/presentation/cubit/scan/scan_cubit.dart';
import 'package:save_up/features/scan/presentation/pages/review_page.dart';
import 'package:save_up/features/scan/presentation/pages/scan_page.dart';
import 'package:save_up/firebase_options.dart';
import 'package:save_up/features/scan/domain/entities/transaksi.dart';
import 'package:save_up/get_it_service.dart' as dependencyinject;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransaksiAdapter());
  await initializeDateFormatting('id_ID', null);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.openBox<Transaksi>('transaksiBox');

  // // Data Layer
  // final transactionRepository = TransactionRepositoryImpl(transactionBox);
  // final scanRepository = ScanRepositoryImpl(transactionBox);

  // // Domain Layer (Use Cases)
  // final getTransactions = GetTransactions(transactionRepository);
  // final getGroupedTransactions = GetGroupedTransactions(transactionRepository);
  // final processImage = ProcessImageUsecase(scanRepository);
  // final saveTransactions = SaveTransactionsUsecase(scanRepository);

  dependencyinject.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavbarCubit()),
        BlocProvider(
          create: (context) => dependencyinject.serviceLocator<ScanCubit>(),
        ),
        BlocProvider(
          create: (context) => dependencyinject.serviceLocator<ReviewCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              dependencyinject.serviceLocator<TransactionCubit>(),
        ),
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
          return null;
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
  void initState() {
    context.read<TransactionCubit>().loadTransactionFromHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarCubitState>(
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
                      context.read<NavbarCubit>().changeTab(0);
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
