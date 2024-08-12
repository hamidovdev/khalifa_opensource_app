import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(activeIndex: 0)) {
    on<ChangeActiveIndex>((event, emit) {
      emit(
        state.copyWith(
          activeIndex: event.index,
        ),
      );
    });
  }
}
