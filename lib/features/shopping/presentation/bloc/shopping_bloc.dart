import 'package:bloc/bloc.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/core/status/page_status.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/shopping/data/datasource/datasource.dart';
import 'package:khalifa/features/shopping/data/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:khalifa/features/shopping/data/repository/repositoryImpl.dart';
import 'package:khalifa/features/shopping/domain/usecase/boolReturnedUsecase.dart';
import 'package:khalifa/features/shopping/domain/usecase/getCategoriesUsecase.dart';
import 'package:khalifa/features/shopping/domain/usecase/getProductById.dart';
import 'package:khalifa/features/shopping/domain/usecase/getProductsUsecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shopping_event.dart';
part 'shopping_state.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  ShoppingBloc()
      : super(
          ShoppingState(
            mainStatus: MainStatus.notfound,
            products: [],
            categories: [],
            productPageNumber: 1,
            activeCategoryId: -1,
            pageStatus: PageStatus.success,
          ),
        ) {
    on<GetCategories>((event, emit) async {
      emit(
        state.copyWith(
          mainStatus: MainStatus.loading,
        ),
      );
      final usecase = CategoriesUsecase(
        repository: ShoppingRepositoryImpl(
          dataSource: ShoppingDataSource(),
        ),
      );
      final either = await usecase.call(NoParams());
      either.either(
        (failure) {
          emit(
            state.copyWith(
              categories: [],
              mainStatus: MainStatus.failure,
            ),
          );
        },
        (value) {
          emit(
            state.copyWith(
              // mainStatus: MainStatus.success,
              categories: value,
            ),
          );
          event.success();
        },
      );
    });
    on<GetProducts>((event, emit) async {
      if (state.products == []) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.loading,
          ),
        );
      } else {
        if (event.isRefresh) {
          emit(
            state.copyWith(
              pageStatus: PageStatus.loading,
              activeCategoryId: -1,
              productPageNumber: 1,
            ),
          );
        } else if (event.isLoading) {
          emit(
            state.copyWith(
              pageStatus: PageStatus.loading,
              activeCategoryId: -1,
              productPageNumber: state.productPageNumber + 1,
            ),
          );
        } else {
          emit(
            state.copyWith(
              mainStatus: MainStatus.loading,
              activeCategoryId: -1,
              productPageNumber: 1,
            ),
          );
        }
      }
      final usecase = ProductsUsecase(
        repository: ShoppingRepositoryImpl(
          dataSource: ShoppingDataSource(),
        ),
      );
      final either = await usecase.call(
        GetProductsParam(pageNumber: state.productPageNumber),
      );
      either.either(
        (failure) {
          if (state.products.isNotEmpty) {
            emit(
              state.copyWith(
                pageStatus: PageStatus.failure,
              ),
            );
          } else {
            emit(
              state.copyWith(
                mainStatus: MainStatus.failure,
                products: [],
                pageStatus: PageStatus.success,
              ),
            );
          }
          event.failure();
        },
        (value) {
          if (event.isLoading) {
            Set<ProductModel> ls = state.products.toSet();
            ls.addAll(value);
            emit(
              state.copyWith(
                mainStatus: MainStatus.success,
                products: ls.toList(),
                pageStatus: PageStatus.success,
              ),
            );
          } else {
            emit(
              state.copyWith(
                mainStatus: MainStatus.success,
                products: value,
                pageStatus: PageStatus.success,
              ),
            );
          }
          event.success();
        },
      );
    });
    on<GetProductById>((event, emit) async {
      emit(
        state.copyWith(
          mainStatus: MainStatus.loading,
        ),
      );
      final usecase = GetProductByIdUsecase(
          repository: ShoppingRepositoryImpl(dataSource: ShoppingDataSource()),
          productId: event.productId);
      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.failure,
          ),
        );
      }, (value) {
        emit(
          state.copyWith(
            product: value,
            mainStatus: MainStatus.success,
          ),
        );
      });
    });
    on<ClickLikeBtn>((event, emit) async {
      final usecase = BoolReturnedUseCase(
        repository: ShoppingRepositoryImpl(
          dataSource: ShoppingDataSource(),
        ),
      );
      final either = await usecase.call(
        ClickLikeBtnParam(
          productId: event.productId,
        ),
      );
      either.either(
        (failure) {
          emit(state);
          event.failure();
        },
        (value) {
          List<ProductModel> ls = [];
          for (var i = 0; i < state.products.length; i++) {
            if (event.productId == state.products[i].id) {
              ls.add(
                state.products[i].copyWith(
                  isLiked: true,
                ),
              );
            } else {
              ls.add(
                state.products[i],
              );
            }
          }
          if (state.product != null) {
            emit(
              state.copyWith(
                products: ls,
                product: state.product!.copyWith(isLiked: true),
              ),
            );
          } else {
            emit(
              state.copyWith(
                products: ls,
              ),
            );
          }
          event.success();
        },
      );
    });
    on<ClickDisLikeBtn>((event, emit) async {
      final usecase = BoolReturnedUseCase(
        repository: ShoppingRepositoryImpl(
          dataSource: ShoppingDataSource(),
        ),
      );
      final either = await usecase.call(
        ClickDisLikeBtnParam(
          productId: event.productId,
        ),
      );
      either.either(
        (failure) {
          emit(state);
          event.failure();
        },
        (value) {
          List<ProductModel> ls = [];
          for (var i = 0; i < state.products.length; i++) {
            if (event.productId == state.products[i].id) {
              ls.add(
                state.products[i].copyWith(
                  isLiked: false,
                ),
              );
            } else {
              ls.add(
                state.products[i],
              );
            }
          }
          if (state.product != null) {
            emit(
              state.copyWith(
                products: ls,
                product: state.product!.copyWith(isLiked: false),
              ),
            );
          } else {
            emit(
              state.copyWith(
                products: ls,
              ),
            );
          }
          event.success();
        },
      );
    });
    on<AddProductToBasket>((event, emit) async {
      emit(state.copyWith(pageStatus: PageStatus.loading));
      final usecase = BoolReturnedUseCase(
        repository: ShoppingRepositoryImpl(
          dataSource: ShoppingDataSource(),
        ),
      );
      final either = await usecase.call(
        AddProductToBasketParam(
          productId: event.productId,
          productAmount: event.productAmount,
        ),
      );
      either.either((failure) {
        emit(state.copyWith(pageStatus: PageStatus.success));
        event.failure();
      }, (value) {
        List<ProductModel> ls = [];
        for (var i = 0; i < state.products.length; i++) {
          if (event.productId != state.products[i].id) {
            ls.add(
              state.products[i],
            );
          } else {
            ls.add(
              state.products[i].copyWith(
                productAmount: ins<SharedPreferences>()
                    .getInt("product_amount-${event.productId}"),
              ),
            );
          }
        }
        emit(state.copyWith(pageStatus: PageStatus.success, products: ls));
        event.success();
      });
    });
    on<GetProductsSorted>((event, emit) async {
      if (state.activeCategoryId == -1) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.loading,
            pageStatus: PageStatus.loading,
            productPageNumber: 1,
          ),
        );
      } else {
        if (event.isRefresh) {
          emit(
            state.copyWith(
              pageStatus: PageStatus.loading,
              productPageNumber: 1,
            ),
          );
        } else if (event.isLoading) {
          print("IsLoding ****************");
          emit(
            state.copyWith(
              pageStatus: PageStatus.loading,
              productPageNumber: state.productPageNumber + 1,
            ),
          );
        } else {
          emit(
            state.copyWith(
                pageStatus: PageStatus.loading,
                mainStatus: MainStatus.loading,
                productPageNumber: 1),
          );
        }
      }

      final usecase = ProductsUsecase(
        repository: ShoppingRepositoryImpl(
          dataSource: ShoppingDataSource(),
        ),
      );
      final either = await usecase.call(
        GetProductsSortedParam(
          pageNumber: state.productPageNumber,
          categoryId: event.categoryId,
        ),
      );
      either.either(
        (failure) {
          if (state.products.isNotEmpty) {
            emit(
              state.copyWith(
                pageStatus: PageStatus.success,
                mainStatus: MainStatus.success,
              ),
            );
          } else {
            emit(
              state.copyWith(
                pageStatus: PageStatus.success,
                mainStatus: MainStatus.failure,
                products: [],
              ),
            );
          }
          event.failure();
        },
        (value) {
          if (state.activeCategoryId == event.categoryId && !event.isRefresh) {
            print("pageNumber= > ${state.productPageNumber}");
            Set<ProductModel> ls = state.products.toSet();
            ls.addAll(value);
            emit(
              state.copyWith(
                pageStatus: PageStatus.success,
                activeCategoryId: event.categoryId,
                products: ls.toList(),
                mainStatus: MainStatus.success,
              ),
            );
          } else {
            print("Else ga keldi---------------------");
            emit(
              state.copyWith(
                pageStatus: PageStatus.success,
                activeCategoryId: event.categoryId,
                products: value,
                mainStatus: MainStatus.success,
              ),
            );
          }
          event.success();
        },
      );
      print("2 state number => ${state.activeCategoryId}");
    });
    on<ClearDataInBloc>((event, emit) {
      emit(state.copyWith(
          mainStatus: MainStatus.notfound, pageStatus: PageStatus.success));
    });
  }
}
