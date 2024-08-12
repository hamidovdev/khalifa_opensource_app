import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/core/widgets/reminder_click_like_btn.dart';
import 'package:khalifa/features/shopping/presentation/bloc/shopping_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WProduct extends StatelessWidget {
  final int id;
  final String img;
  final String title;
  final String descrption;
  final String price;
  final bool isLiked;
  final int productAmount;
  const WProduct({
    super.key,
    required this.img,
    required this.title,
    required this.descrption,
    required this.price,
    required this.id,
    required this.isLiked,
    required this.productAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      foregroundDecoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.white,
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    img,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (ins<SharedPreferences>().getString("token") != null) {
                        if (isLiked) {
                          context.read<ShoppingBloc>().add(
                                ClickDisLikeBtn(
                                  productId: id,
                                  success: () {},
                                  failure: () {},
                                ),
                              );
                        } else {
                          context.read<ShoppingBloc>().add(
                                ClickLikeBtn(
                                  productId: id,
                                  success: () {},
                                  failure: () {},
                                ),
                              );
                        }
                      } else {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const ReminderClickLike();
                          },
                        );
                      }
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          // Icons.favorite_rounded,
                          isLiked
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          color: context.colors.redish1,
                        )),
                  )
                ],
              ),
            ),
          ),
          const Gap(5),
          SizedBox(
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.colors.dark1,
                  letterSpacing: 0.7),
            ),
          ),
          const Gap(2),
          SizedBox(
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              descrption,
              style: context.style.fontSize14Weight400Dark,
            ),
          ),
          const Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(color: context.colors.white),
                      child: Text(
                        price,
                        style: context.style.fontSize13Weight500Dark,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(color: context.colors.greyish1),
                      child: Text(
                        "USD",
                        style: context.style.fontSize13Weight500White,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
