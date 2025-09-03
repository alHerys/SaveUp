import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial(tabIndex: 0));

  void changeTab(int index) {
    emit(HomeCubitInitial(tabIndex: index));
  }
}
