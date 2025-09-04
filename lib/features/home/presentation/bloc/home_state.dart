part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  final int tabIndexState;

  const HomeState({required this.tabIndexState});
}

final class HomeInitial extends HomeState {
  const HomeInitial({required super.tabIndexState});
}
