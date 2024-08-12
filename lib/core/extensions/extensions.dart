import 'package:flutter/material.dart';
import 'package:khalifa/assets/colors.dart';
import 'package:khalifa/assets/fonts.dart';
import 'package:khalifa/assets/images_and_icons.dart';
import 'package:khalifa/assets/theme.dart';
import 'package:khalifa/core/entity/entity.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:khalifa/features/authentication/data/model/model.dart';
import 'package:khalifa/features/authentication/domain/entity/entity.dart';
import 'package:khalifa/features/shopping/domain/entity/entity.dart';

extension ContextConfigure on BuildContext {
  AppIcons get icons {
    return AppIcons();
  }

  AppColors get colors {
    return AppColors();
  }

  AppTheme get theme {
    return AppTheme();
  }

  AppFonts get style {
    return theme.lightTheme().extension<AppFonts>()!;
  }
}

extension AuthModelToAuthEntity on AuthModel {
  AuthEntity get toEntity {
    return AuthEntity(
      email: email,
      token: token,
      user_id: user_id,
    );
  }
}

extension ProductModelToProductEntity on ProductModel {
  ProductEntity get toProductEntity {
    return ProductEntity(
      id: id,
      name: name,
      productOwner: productOwner,
      photosOrVideos: photosOrVideos,
      category: category,
      price: price,
      productComment: productComment,
    );
  }
}

extension ProductModelToShoppingEntity on ProductModel {
  ShoppingEntity get toShoppingEntity {
    return ShoppingEntity(
      id: id,
      name: name,
      productOwner: productOwner,
      photosOrVideos: photosOrVideos,
      category: category,
      price: price,
      productComment: productComment,
      isLiked: isLiked,
      productAmount: productAmount,
    );
  }
}
