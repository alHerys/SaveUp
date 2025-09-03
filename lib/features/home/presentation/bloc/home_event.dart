// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class TabChange extends HomeEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
