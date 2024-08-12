import 'package:bloc/bloc.dart';
import 'package:khalifa/core/entity/entity.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/likes/data/datasource/datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:khalifa/features/likes/data/repository/repository.dart';
import 'package:khalifa/features/likes/domain/usecase/usecase.dart';

part 'likes_event.dart';
part 'likes_state.dart';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  LikesBloc()
      : super(LikesState(
          mainStatus: MainStatus.notfound,
          products: [],
        )) {
    on<GetLikesProduct>((event, emit) async {
      emit(
        state.copyWith(
          mainStatus: MainStatus.loading,
        ),
      );
      final usecase = LikesUseCase(
        repository: LikesRepositoryImpl(
          dataSource: LikesDataSource(),
        ),
      );
      final either = await usecase.call(
        NoParams(),
      );
      either.either((failure) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.failure,
          ),
        );
      }, (value) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.success,
            products: value,
          ),
        );
      });
    });
  }
}
