import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/route_names/app_route_names.dart';
import 'package:khalifa/core/widgets/w_button.dart';
import 'package:khalifa/core/widgets/w_textfield.dart';
import 'package:khalifa/features/authentication/presentation/bloc/authentication_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(125),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.colors.dark1,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 45),
                    child: Text(
                      "A",
                      style: context.style.fontSize60Weight600,
                    ),
                  ),
                ),
                const Gap(70),
                Text(
                  "email",
                  style: context.style.fontSize16Weight400ColorGreenish,
                ).tr(),
                const Gap(5),
                WTextField(
                  textInputAction: TextInputAction.next,
                  fillColor: context.colors.white,
                  autoFocus: true,
                  controller: emailController,
                  hintText: "enter_your_email".tr(),
                  hintTextStyle: context.style.fontSize16Weight400ColorGreenish,
                  cursorColor: context.colors.dark1,
                  textStyle:
                      context.style.fontSize16Weight500ColorDarkOpacity05,
                  cursorHeight: 26,
                  keyBoardType: TextInputType.emailAddress,
                ),
                const Gap(15),
                Text(
                  "password",
                  style: context.style.fontSize16Weight400ColorGreenish,
                ).tr(),
                const Gap(5),
                WTextField(
                  textInputAction: TextInputAction.done,
                  onEditCompleted: () {},
                  fillColor: context.colors.white,
                  autoFocus: true,
                  controller: passwordController,
                  hintText: "enter_the_password".tr(),
                  hintTextStyle: context.style.fontSize16Weight400ColorGreenish,
                  cursorColor: context.colors.dark1,
                  textStyle:
                      context.style.fontSize16Weight500ColorDarkOpacity05,
                  cursorHeight: 26,
                  keyBoardType: TextInputType.text,
                  isObscureText: true,
                ),
                const Gap(10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "${"have_you_registered_before".tr()}?",
                      style: context
                          .style.fontSize12Weight600ColorBlushLetterSpacing08,
                    ).tr(),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: WButton(
              color: context.colors.blush,
              borderRadius: 8,
              onTap: () {
                context.read<AuthenticationBloc>().add(
                      SignUpEvent(
                        email: emailController.text,
                        password: passwordController.text,
                        success: () {
                          Navigator.of(context)
                              .pushNamed(AppRouteNames.confirmCode);
                        },
                        failure: () {
                          print("Keldiiiiiiiiiiiiiiiiiiiiiiiii");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('used_email').tr(),
                            ),
                          );
                        },
                      ),
                    );
              },
              child: Text(
                "signUp",
                style: context.style.fontSize16Weight500,
              ).tr(),
            ),
          ),
        );
      },
    );
  }
}
