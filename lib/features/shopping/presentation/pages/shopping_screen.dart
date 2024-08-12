import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:khalifa/core/route_names/shopping_route_names.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/features/shopping/data/model/model.dart';
import 'package:khalifa/features/shopping/presentation/bloc/shopping_bloc.dart';
import 'package:khalifa/core/mixins/mainShimmer.dart';
import 'package:khalifa/features/shopping/presentation/widgets/wproduct.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  PageController pageController = PageController(
    initialPage: 0,
  );
  RefreshController refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Khalifa",
            style: context.style.fontSize24Weight500Dark),
      ),
      body: BlocBuilder<ShoppingBloc, ShoppingState>(
        builder: (context, state) {
          switch (state.mainStatus) {
            case MainStatus.notfound:
              context.read<ShoppingBloc>().add(GetCategories(
                success: () {
                  context.read<ShoppingBloc>().add(
                        GetProducts(
                          isRefresh: false,
                          isLoading: false,
                          failure: () {},
                          success: () {},
                        ),
                      );
                },
              ));
              return const MainShimmer();
            case MainStatus.failure:
              return SmartRefresher(
                controller: refreshController,
                onRefresh: () {
                  context.read<ShoppingBloc>().add(GetCategories(
                    success: () {
                      context.read<ShoppingBloc>().add(
                            GetProducts(
                              isRefresh: false,
                              isLoading: false,
                              failure: () async {
                                await Future.delayed(
                                    const Duration(seconds: 2));

                                refreshController.refreshCompleted();
                              },
                              success: () async {
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                refreshController.refreshCompleted();
                              },
                            ),
                          );
                    },
                  ));
                },
                child: Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      "an_arror".tr(),
                      style: context.style.fontSize22Weight500Red),
                ),
              );
            case MainStatus.loading:
              return const MainShimmer();
            case MainStatus.success:
              List<CategoryModel> categories = state.categories;
              final List<ProductModel> products = state.products;
              return SmartRefresher(
                controller: refreshController,
                onRefresh: () async {
                  if (state.activeCategoryId == -1) {
                    context.read<ShoppingBloc>().add(
                          GetProducts(
                            isRefresh: true,
                            isLoading: false,
                            failure: () async {
                              await Future.delayed(const Duration(seconds: 2));

                              refreshController.refreshCompleted();
                            },
                            success: () async {
                              await Future.delayed(const Duration(seconds: 2));
                              refreshController.refreshCompleted();
                            },
                          ),
                        );
                  } else {
                    context.read<ShoppingBloc>().add(
                          GetProductsSorted(
                            categoryId: state.activeCategoryId!,
                            isLoading: false,
                            isRefresh: true,
                            success: () async {
                              await Future.delayed(const Duration(seconds: 2));
                              refreshController.refreshCompleted();
                            },
                            failure: () async {
                              await Future.delayed(const Duration(seconds: 2));
                              refreshController.refreshCompleted();
                            },
                          ),
                        );
                  }
                },
                onLoading: () async {
                  if (state.activeCategoryId == -1) {
                    context.read<ShoppingBloc>().add(
                          GetProducts(
                            isRefresh: false,
                            isLoading: true,
                            failure: () async {
                              await Future.delayed(const Duration(seconds: 2));

                              refreshController.loadComplete();
                            },
                            success: () async {
                              await Future.delayed(const Duration(seconds: 2));

                              refreshController.loadComplete();
                            },
                          ),
                        );
                  } else {
                    context.read<ShoppingBloc>().add(
                          GetProductsSorted(
                            categoryId: state.activeCategoryId!,
                            isLoading: true,
                            isRefresh: false,
                            success: () async {
                              await Future.delayed(const Duration(seconds: 2));

                              refreshController.loadComplete();
                            },
                            failure: () async {
                              await Future.delayed(const Duration(seconds: 2));

                              refreshController.loadComplete();
                            },
                          ),
                        );
                  }
                },
                enablePullUp: true,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (state.activeCategoryId != -1) {
                                        context
                                            .read<ShoppingBloc>()
                                            .add(GetProducts(
                                              isRefresh: false,
                                              isLoading: false,
                                              failure: () {},
                                              success: () {},
                                            ));
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 46,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: BoxDecoration(
                                          border: state.activeCategoryId == -1
                                              ? const Border.fromBorderSide(
                                                  BorderSide.none)
                                              : Border.all(
                                                  color: context.colors.blush,
                                                  width: 2,
                                                ),
                                          color: state.activeCategoryId == -1
                                              ? context.colors.blush
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        "all".tr(),
                                        style: state.activeCategoryId == -1
                                            ? context
                                                .style.fontSize16Weight500White
                                            : context
                                                .style.fontSize16Weight500Blush,
                                      ),
                                    ),
                                  ),
                                  ...List.generate(
                                    categories.length,
                                    (index) {
                                      return InkWell(
                                        onTap: () {
                                          if (state.activeCategoryId !=
                                              categories[index].id) {
                                            context.read<ShoppingBloc>().add(
                                                  GetProductsSorted(
                                                    categoryId:
                                                        categories[index].id,
                                                    isLoading: false,
                                                    isRefresh: false,
                                                    failure: () {},
                                                    success: () {},
                                                  ),
                                                );
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 46,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                              border: state.activeCategoryId ==
                                                      categories[index].id
                                                  ? const Border.fromBorderSide(
                                                      BorderSide.none)
                                                  : Border.all(
                                                      color:
                                                          context.colors.blush,
                                                      width: 2,
                                                    ),
                                              color: state.activeCategoryId ==
                                                      categories[index].id
                                                  ? context.colors.blush
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Text(
                                            categories[index].name,
                                            style: state.activeCategoryId ==
                                                    categories[index].id
                                                ? context.style
                                                    .fontSize16Weight500White
                                                : context.style
                                                    .fontSize16Weight500Blush,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "products".tr(),
                            style: context.style.fontSize26Weight500WhitishDark,
                          ),
                          const Gap(10),
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 20,
                            children: [
                              ...List.generate(
                                products.length,
                                (index) {
                                  return StaggeredGrid.count(
                                    crossAxisCount: 1,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<ShoppingBloc>()
                                              .add(ClearDataInBloc());
                                          Navigator.of(context,
                                                  rootNavigator: false)
                                              .pushNamed(
                                            ShoppingRouteNames.pushSingleScreen,
                                            arguments: products[index].id,
                                          );
                                        },
                                        child: WProduct(
                                          img: products[index]
                                              .photosOrVideos[0]
                                              .file,
                                          title: products[index].name,
                                          descrption:
                                              products[index].productComment,
                                          price: products[index].price,
                                          id: products[index].id,
                                          isLiked: products[index].isLiked,
                                          productAmount:
                                              products[index].productAmount,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
