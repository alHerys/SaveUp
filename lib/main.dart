import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/asisten/presentation/pages/asisten_page.dart';
import 'package:save_up/features/home/presentation/bloc/home_bloc.dart';
import 'package:save_up/features/home/presentation/cubit/home_cubit.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';
import 'package:save_up/features/home/presentation/widgets/navbar.dart';
import 'package:save_up/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:save_up/features/scan/presentation/pages/scan_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  // final apiKey = dotenv.env['GEMINI_API_KEY'];
  // final apiKey = Const.apiKey;
  // final model = GenerativeModel(model: 'gemini-2.0-flash-lite', apiKey: apiKey!);
  // final content = [Content.text('Can you give answer in JSON format? Show me!')];
  // final response = await model.generateContent(content);
  // print(response.text);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => HomeCubit()),
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
