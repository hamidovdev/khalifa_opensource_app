import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:khalifa/features/shopping/data/datasource/datasource.dart';
import 'package:khalifa/features/shopping/data/model/model.dart';
import 'package:khalifa/features/shopping/domain/repository/repository.dart';

class ShoppingRepositoryImpl implements Shoppingrepository {
  final ShoppingDataSource _dataSource;

  ShoppingRepositoryImpl({required ShoppingDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final categories = await _dataSource.getCategories();
      return Right(
        categories,
      );
    } catch (e) {
      return Left(
        const ServerFailure(
          message: "",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts(
      int pageNumber) async {
    try {
      final products = await _dataSource.getProducts(pageNumber);
      return Right(
        products,
      );
    } catch (e) {
      return Left(
        const ServerFailure(
          message: "",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addProductToBasket(
    int productId,
    int productAmount,
  ) async {
    try {
      final result = await _dataSource.addProductToBasket(
        productId,
        productAmount,
      );
      return Right(
        result,
      );
    } catch (e) {
      return Left(
        const ServerFailure(
          message: "",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> clickLikeBtn(
    int productId,
  ) async {
    try {
      final result = await _dataSource.clickLikeBtn(
        productId,
      );
      return Right(
        result,
      );
    } catch (e) {
      return Left(
        const ServerFailure(
          message: "",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsSorted(
      int pageNumber, int categoryId) async {
    try {
      final products =
          await _dataSource.getProductsSorted(pageNumber, categoryId);
      return Right(
        products,
      );
    } catch (e) {
      return Left(
        const ServerFailure(
          message: "",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> clickDisLikeBtn(int productId) async {
    try {
      final result = await _dataSource.clickDisLikeBtn(
        productId,
      );
      return Right(
        result,
      );
    } catch (e) {
      return Left(
        const ServerFailure(
          message: "",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(int productId) async {
    try {
      final product = await _dataSource.getProductById(productId);
      return Right(product);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
