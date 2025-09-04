part of 'navbar_cubit.dart';

@immutable
sealed class NavbarCubitState {
  final int tabIndex;

  const NavbarCubitState({required this.tabIndex});
}

final class NavbarInitial extends NavbarCubitState {
  const NavbarInitial({required super.tabIndex});
}
