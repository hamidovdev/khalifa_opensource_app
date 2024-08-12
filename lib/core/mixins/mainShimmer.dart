import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:shimmer/shimmer.dart';

class MainShimmer extends StatelessWidget {
  const MainShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Shimmer.fromColors(
        baseColor: context.colors.greyish1.withOpacity(0.3),
        highlightColor: context.colors.greyish1.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  height: 46,
                  width: MediaQuery.sizeOf(context).width / 100 * 38,
                  decoration: BoxDecoration(
                    color: context.colors.blush.withOpacity(1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 46,
                  width: MediaQuery.sizeOf(context).width / 100 * 28,
                  decoration: BoxDecoration(
                    color: context.colors.blush.withOpacity(1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 46,
                  width: MediaQuery.sizeOf(context).width / 100 * 18,
                  decoration: BoxDecoration(
                    color: context.colors.blush.withOpacity(1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: context.colors.blush.withOpacity(1),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const Gap(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ...List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: MediaQuery.sizeOf(context).width / 100 * 43,
                        height: index == 0 ? 180 : (index == 1 ? 225 : 160),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context.colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        width: MediaQuery.sizeOf(context).width / 100 * 43,
                        height: index == 0 ? 280 : (index == 1 ? 200 : 85),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context.colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
