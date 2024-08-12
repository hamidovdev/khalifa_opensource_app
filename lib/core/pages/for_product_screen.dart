import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/assets/images_and_icons.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/features/shopping/presentation/bloc/shopping_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ForProductScreen extends StatefulWidget {
  final int productId;
  const ForProductScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ForProductScreen> createState() => _ForProductScreenState();
}

class _ForProductScreenState extends State<ForProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left_rounded,
            size: 34,
          ),
        ),
      ),
      body: BlocBuilder<ShoppingBloc, ShoppingState>(
        builder: (context, state) {
          switch (state.mainStatus) {
            case MainStatus.notfound:
              context.read<ShoppingBloc>().add(
                    GetProductById(
                      productId: widget.productId,
                    ),
                  );
              return const SizedBox();
            case MainStatus.failure:
              return Center(
                child: Text(
                  "again_enter_app_error".tr(),
                  style: context.style.fontSize22Weight500Red,
                ),
              );
            case MainStatus.loading:
              return const Center(child: CupertinoActivityIndicator());
            case MainStatus.success:
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.network(
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                          state.product!.photosOrVideos[0].file,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (state.product!.isLiked) {
                              context.read<ShoppingBloc>().add(
                                    ClickDisLikeBtn(
                                      productId: state.product!.id,
                                      success: () {},
                                      failure: () {},
                                    ),
                                  );
                            } else {
                              context.read<ShoppingBloc>().add(
                                    ClickLikeBtn(
                                      productId: state.product!.id,
                                      success: () {},
                                      failure: () {},
                                    ),
                                  );
                            }
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                size: 35,
                                state.product!.isLiked
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_outline_rounded,
                                color: context.colors.redish1,
                              )),
                        )
                      ],
                    ),
                    const Gap(10),
                    Text(
                      state.product!.name,
                      style: context.style.fontSize24Weight500Dark,
                    ),
                    const Gap(10),
                    Text(
                      state.product!.productComment,
                      style: context.style.fontSize16Weight500Dark,
                    ),
                    const Gap(15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(color: context.colors.white),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.product!.price,
                              style: context.style.fontSize25Weight500Dark,
                            ),
                            const Gap(5),
                            Text(
                              "USD",
                              style: context.style.fontSize22Weight500Greenish,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(40),
                    GestureDetector(
                      onTap: () async {
                        String username =
                            state.product!.exOwnerTgUsername.toString();
                        final url =
                            "https://t.me/$username${Platform.isAndroid ? "?" : "&"}body=Hello";
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        }
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                            color: context.colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                AppImages.telegram_img,
                              ),
                            ),
                            const Gap(15),
                            Text(
                              "@${state.product!.exOwnerTgUsername}",
                              style: context.style.fontSize22Weight500Greeyish,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: () async {
                        String phoneNumber =
                            state.product!.exOwnerNumber.toString();
                        final url = "tel:$phoneNumber";
                        if (await canLaunchUrlString(url)) {
                          await launchUrlString(url);
                        }
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                            color: context.colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.calling_img,
                            ),
                            const Gap(15),
                            Text(
                              state.product!.exOwnerNumber.toString(),
                              style: context.style.fontSize22Weight500Greeyish,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Gap(40),
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
}
