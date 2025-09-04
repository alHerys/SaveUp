import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_cubit_state.dart';

class NavbarCubit extends Cubit<NavbarCubitState> {
  NavbarCubit() : super(NavbarInitial(tabIndex: 0));

  void changeTab(int index) {
    emit(NavbarInitial(tabIndex: index));
  }
}
