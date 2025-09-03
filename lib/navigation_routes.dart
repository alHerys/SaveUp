// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:save_up/features/home/presentation/bloc/home_bloc.dart';
// import 'package:save_up/features/onboarding/presentation/pages/onboarding/onboarding_page.dart';
// import 'package:save_up/features/scan/presentation/pages/scan1.dart';
// import 'package:save_up/main.dart';

// class NavigationRoutes {
//   final HomeBloc homeBloc = HomeBloc();
//   Route generateRoute(RouteSettings settings) {
//     // final arguments = settings.arguments; //? Mungkin nanti akan dipakai??
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider.value(value: homeBloc, child: const OnboardingPage()),
//         );
//       case '/asisten':
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider.value(value: homeBloc, child: const MainPage()),
//         );
//       case '/scan':
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider.value(value: homeBloc, child: const Scan1()),
//         );
//       case '/home':
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider.value(value: homeBloc, child: const MainPage()),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider.value(value: homeBloc, child: const MainPage()),
//         );
//     }
//   }
// }
