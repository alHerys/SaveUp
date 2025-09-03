import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(tabIndex: 0)) {
    on<TabChange>((event, emit) {
      emit(HomeInitial(tabIndex: event.tabIndex));
    });
  }
}
