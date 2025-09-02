part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class TabChange extends HomeEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});

}