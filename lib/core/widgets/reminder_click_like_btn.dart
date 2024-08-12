import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/route_names/app_route_names.dart';

class ReminderClickLike extends StatelessWidget {
  const ReminderClickLike({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "${"reminder".tr()}!",
      ),
      titleTextStyle: context.style.fontSize24Weight500Dark,
      elevation: 0,
      backgroundColor: context.colors.white,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.sizeOf(context).width / 100 * 80,
        height: MediaQuery.sizeOf(context).height / 100 * 15,
        child: Column(
          children: [
            Text(
              "${"you_agree_first_register".tr()}?",
              style: context.style.fontSize16Weight500Dark,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRouteNames.signIn,
                      (route) => false,
                    );
                  },
                  child: Text(
                    "login".tr(),
                    style: context.style.fontSize16Weight500Blush,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "later".tr(),
                    style: context.style.fontSize16Weight500Blush,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
