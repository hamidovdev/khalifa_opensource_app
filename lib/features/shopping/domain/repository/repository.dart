import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:khalifa/features/shopping/data/model/model.dart';

abstract class Shoppingrepository {
  Future<Either<Failure, List<ProductModel>>> getProducts(int pageNumber);
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, bool>> clickLikeBtn(int productId);
  Future<Either<Failure, bool>> clickDisLikeBtn(int productId);
  Future<Either<Failure, bool>> addProductToBasket(
      int productId, int productAmount);
  Future<Either<Failure, List<ProductModel>>> getProductsSorted(
    int pageNumber,
    int categoryId,
  );
  Future<Either<Failure, ProductModel>> getProductById(int productId);
}
