import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:save_up/features/asisten/presentation/bloc/home_bloc.dart';
import 'package:save_up/features/asisten/presentation/pages/asisten_page.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';

class NavigationRoutes {
  final HomeBloc homeBloc = HomeBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/asisten':
        return MaterialPageRoute(
          builder: (context) => const AsistenPage(),
        );
      case '/scan':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}