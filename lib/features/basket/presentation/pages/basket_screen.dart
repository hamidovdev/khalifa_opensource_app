import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:khalifa/assets/images_and_icons.dart';
import 'package:khalifa/core/extensions/extensions.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Gap(80),
            Padding(
              padding: const EdgeInsets.all(90),
              child: Image.asset(
                AppImages.technicalWorking,
                color: context.colors.dark1,
              ),
            ),
            const Gap(20),
            Text(
              "${"basket".tr()} ${"soon".tr()}",
              style: context.style.fontSize35Weight600Spacing08,
            )
          ],
        ),
      ),
    );
  }
}
