import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_up/features/home/presentation/bloc/home_bloc.dart';
import 'package:save_up/features/home/presentation/pages/home_page.dart';
import 'package:save_up/features/onboarding/presentation/pages/onboarding/onboarding_page.dart';

class NavigationRoutes {
  final HomeBloc homeBloc = HomeBloc();
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: homeBloc, child: const OnboardingPage()),
        );
      case '/asisten':
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: homeBloc, child: const HomePage()),
        );
      case '/scan':
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: homeBloc, child: const HomePage()),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: homeBloc, child: const HomePage()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: homeBloc, child: const HomePage()),
        );
    }
  }
}
