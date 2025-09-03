part of 'home_cubit.dart';

@immutable
sealed class HomeCubitState {
  final int tabIndex;

  const HomeCubitState({required this.tabIndex});
}

final class HomeCubitInitial extends HomeCubitState {
  const HomeCubitInitial({required super.tabIndex});
}
