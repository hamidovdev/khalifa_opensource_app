import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/assets/images_and_icons.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/route_names/app_route_names.dart';
import 'package:khalifa/core/widgets/w_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  bool firstPage = true;
  String language = "uz";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: PageView(
            onPageChanged: (value) {
              firstPage = firstPage ? false : true;
              setState(() {});
            },
            controller: controller,
            children: [
              Builder(builder: (context) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: DropdownButton2(
                        customButton: context.icons.language,
                        value: language,
                        // isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: "uz",
                            child: Text(
                              "Uz",
                              style: context
                                  .style.fontSize16Weight500ColorDarkOpacity05,
                            ),
                          ),
                          DropdownMenuItem(
                            value: "en",
                            child: Text(
                              "En",
                              style: context
                                  .style.fontSize16Weight500ColorDarkOpacity05,
                            ),
                          ),
                          DropdownMenuItem(
                            value: "ru",
                            child: Text(
                              "Ru",
                              style: context
                                  .style.fontSize16Weight500ColorDarkOpacity05,
                            ),
                          ),
                        ],
                        onChanged: (value) async {
                          language = value!;
                          print(value);
                          if (value == "uz") {
                            await context.setLocale(const Locale("uz", "UZ"));
                          } else if (value == "ru") {
                            await context.setLocale(const Locale("ru", "RU"));
                          } else {
                            await context.setLocale(const Locale("en", "EN"));
                          }
                        },
                        dropdownStyleData: DropdownStyleData(
                          width: 54,
                          isOverButton: true,
                          decoration: BoxDecoration(
                            color: context.colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const Gap(50),
                    Image.asset(AppImages.onBoardImg),
                    const Gap(20),
                    Text("onboard_text1",
                            style: context
                                .style.fontSize16Weight500ColorDarkOpacity05)
                        .tr(),
                    const Gap(10),
                    Text("onboard_text2",
                            textAlign: TextAlign.center,
                            style: context
                                .style.fontSize16Weight500ColorDarkOpacity05)
                        .tr(),
                    Text("onboard_text3",
                            textAlign: TextAlign.center,
                            style: context
                                .style.fontSize16Weight500ColorDarkOpacity05)
                        .tr(),
                    const Gap(10),
                    Text("onboard_text4",
                            textAlign: TextAlign.center,
                            style: context
                                .style.fontSize16Weight500ColorDarkOpacity05)
                        .tr(),
                  ],
                );
              }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(80),
                  Image.asset(AppImages.onBoardImg2),
                  const Gap(20),
                  Text(
                    "•  ${"regular_discounts".tr()}",
                    style: context.style.fontSize16Weight500ColorDarkOpacity05,
                  ),
                  const Gap(30),
                  Text(
                    "•  ${"beautiful_interface".tr()}",
                    style: context.style.fontSize16Weight500ColorDarkOpacity05,
                  ),
                  const Gap(30),
                  Text(
                    "•  ${"convenient_and_cheap_price".tr()}",
                    style: context.style.fontSize16Weight500ColorDarkOpacity05,
                  ),
                  Gap(40),
                  Text(
                    "${"want_login".tr()}!",
                    style: context.style.fontSize16Weight500ColorDarkOpacity05,
                  ),
                  Gap(10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouteNames.signIn,
                        (route) => false,
                      );
                    },
                    child: Text(
                      "login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: context.colors.blush,
                        color: context.colors.blush,
                      ),
                    ).tr(),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WButton(
                color: context.colors.whitishDark,
                borderRadius: 12,
                height: 44,
                width: 50,
                padding: const EdgeInsets.all(10),
                onTap: () {
                  controller.previousPage(
                    duration: const Duration(
                      milliseconds: 250,
                    ),
                    curve: Curves.ease,
                  );
                },
                child: context.icons.left,
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 8,
                    width: firstPage ? 24 : 8,
                    decoration: BoxDecoration(
                        color: firstPage
                            ? context.colors.dark1
                            : context.colors.greyish1,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Gap(5),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 8,
                    width: !firstPage ? 24 : 8,
                    decoration: BoxDecoration(
                        color: !firstPage
                            ? context.colors.dark1
                            : context.colors.greyish1,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
              WButton(
                color: context.colors.whitishDark,
                borderRadius: 12,
                height: 44,
                width: 50,
                padding: const EdgeInsets.all(10),
                onTap: () {
                  if (firstPage) {
                    controller.nextPage(
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      curve: Curves.ease,
                    );
                  } else {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouteNames.home, (route) => false);
                  }
                },
                child: context.icons.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
