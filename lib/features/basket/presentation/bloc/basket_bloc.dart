import 'package:bloc/bloc.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/core/status/page_status.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/basket/data/datasource/datasource.dart';
import 'package:khalifa/features/basket/data/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:khalifa/features/basket/data/repository/repository.dart';
import 'package:khalifa/features/basket/domain/usecase/boolReturnedBasketProductUseCase.dart';
import 'package:khalifa/features/basket/domain/usecase/getBasketProductsUseCase.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc()
      : super(BasketState(
          amount: 0,
          mainStatus: MainStatus.notfound,
          products: [],
          pageStatus: PageStatus.success,
        )) {
    on<GetBasketProducts>((event, emit) async {
      emit(state.copyWith(mainStatus: MainStatus.loading));
      final usecase = GetBasketProductsUseCase(
        basketetRepository: BasketetRepositoryImpl(
          dataSource: BasketDataSource(),
        ),
      );
      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(state.copyWith(mainStatus: MainStatus.failure));
      }, (value) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.success,
            products: value,
          ),
        );
      });
    });
    on<DeleteBasketProduct>((event, emit) async {
      emit(state.copyWith(
        pageStatus: PageStatus.loading,
      ));
      final usecase = BoolReturnedBasketProductUseCase(
        repositoryImpl: BasketetRepositoryImpl(
          dataSource: BasketDataSource(),
        ),
      );
      final either = await usecase
          .call(DeleteProductBasketParam(productId: event.productId));
      either.either((failure) {
        emit(
          state.copyWith(
            pageStatus: PageStatus.failure,
          ),
        );
        event.failure();
      }, (value) {
        emit(state.copyWith(
          pageStatus: PageStatus.success,
        ));
        event.success();
      });
    });
    on<AddBasketProduct>((event, emit) async {
      emit(state.copyWith(
        pageStatus: PageStatus.loading,
      ));
      final usecase = BoolReturnedBasketProductUseCase(
        repositoryImpl: BasketetRepositoryImpl(
          dataSource: BasketDataSource(),
        ),
      );
      final either = await usecase.call(
        AddProductBasketParam(
          productId: event.productId,
          productAmount: event.productAmount,
        ),
      );
      either.either((failure) {
        emit(
          state.copyWith(
            pageStatus: PageStatus.failure,
          ),
        );
        event.success();
      }, (value) {
        emit(
          state.copyWith(
            pageStatus: PageStatus.success,
          ),
        );
        event.success();
      });
    });
  }
}
