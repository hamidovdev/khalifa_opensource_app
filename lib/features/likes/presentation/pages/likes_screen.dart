import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/core/route_names/likes_screen_route_names.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/features/likes/presentation/bloc/likes_bloc.dart';
import 'package:khalifa/features/shopping/presentation/bloc/shopping_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "liked_products".tr(),
          style: context.style.fontSize24Weight500DarkSpacing1,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<LikesBloc>().add(GetLikesProduct());
        },
        color: context.colors.white,
        backgroundColor: context.colors.greyish1,
        child: BlocBuilder<LikesBloc, LikesState>(
          builder: (context, state) {
            if (ins<SharedPreferences>().getString("token") == null) {
              return const Center(
                child: Text("Hozircha malumotlar yo'q"),
              );
            }
            switch (state.mainStatus) {
              case MainStatus.notfound:
                context.read<LikesBloc>().add(GetLikesProduct());
                return const SizedBox();
              case MainStatus.failure:
                return Center(
                  child: Text(
                    "again_enter_app_error".tr(),
                    style: context.style.fontSize22Weight500Red,
                  ),
                );
              case MainStatus.loading:
                return const Center(
                  child: CupertinoActivityIndicator(),
                );

              case MainStatus.success:
                final products = state.products;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      ...List.generate(
                        products.length,
                        (index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context
                                  .read<ShoppingBloc>()
                                  .add(ClearDataInBloc());
                              Navigator.of(context, rootNavigator: false)
                                  .pushNamed(
                                LikesRouteNames.pushSingleScreen,
                                arguments: products[index].id,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: context.colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              height: 140,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      width: 100,
                                      height: 120,
                                      fit: BoxFit.cover,
                                      products[index].photosOrVideos[0].file,
                                    ),
                                  ),
                                  const Gap(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                100 *
                                                55,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          products[index].name,
                                          style: context
                                              .style.fontSize20Weight400Dark,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                100 *
                                                55,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          products[index].productComment,
                                          style: context
                                              .style.fontSize17Weight400Dark,
                                        ),
                                      ),
                                      const Gap(5),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                100 *
                                                55,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: context
                                                      .colors.whitishGreey),
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                products[index].price,
                                                style: context.style
                                                    .fontSize17Weight400Dark,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: context.colors.blush),
                                              child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  "USD",
                                                  style: context.style
                                                      .fontSize17Weight400White),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
