import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/route_names/app_route_names.dart';

import 'package:khalifa/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:pinput/pinput.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({super.key});

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PinTheme defaultPinTheme = PinTheme(
      width: 61,
      height: 65,
      textStyle: context.style.fontSize24Weight600Dark,
      decoration: BoxDecoration(
        color: context.colors.white,
        border: Border.all(
          color: context.colors.blush.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Gap(100),
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
                      "F",
                      style: context.style.fontSize60Weight600,
                    ),
                  ),
                ),
                const Gap(70),
                Text(
                  "confirm_code_text",
                  style: context.style.fontSize16Weight500ColorDarkOpacity05,
                  textAlign: TextAlign.center,
                ).tr(),
                const Gap(20),
                Align(
                  alignment: Alignment.center,
                  child: Pinput(
                    autofocus: true,
                    focusNode: FocusNode(),
                    keyboardType: TextInputType.number,
                    controller: controller,
                    length: 5,
                    forceErrorState: state.isError,
                    enableSuggestions: state.confirmationCode,
                    defaultPinTheme: state.confirmationCode
                        ? defaultPinTheme.copyBorderWith(
                            border: Border.all(color: context.colors.greenish1))
                        : defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: context.colors.blush),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(
                        color: !state.confirmationCode
                            ? context.colors.redish1
                            : context.colors.blush,
                      ),
                    ),
                    onCompleted: (value) {
                      if (state.confirmationCode) {
                        context.read<AuthenticationBloc>().add(
                              GetTokenEvent(
                                email: state.doubleUser!.email!,
                                password: state.doubleUser!.password!,
                                success: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRouteNames.home);
                                },
                              ),
                            );
                      }
                    },
                    onChanged: (value) {
                      if (value.length == 5) {
                        context.read<AuthenticationBloc>().add(
                              ConfirmCodeEvent(
                                email: state.doubleUser!.email!,
                                code: int.parse(
                                  value != "" ? value : "0",
                                ),
                                success: () {
                                  context.read<AuthenticationBloc>().add(
                                        GetTokenEvent(
                                          email: state.doubleUser!.email!,
                                          password: state.doubleUser!.password!,
                                          success: () {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    AppRouteNames.home,
                                                    (route) => false);
                                          },
                                        ),
                                      );
                                },
                              ),
                            );
                      }
                    },
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${"recent_code".tr()}. ",
                      style: context.style.fontSize16Weight400ColorGreenish,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<AuthenticationBloc>().add(
                              SignUpEvent(
                                email: state.doubleUser!.email!,
                                password: state.doubleUser!.password!,
                                success: () {},
                                failure: () {},
                              ),
                            );
                        controller.text = "";
                      },
                      child: Text(
                        "resend".tr(),
                        style: context.style.fontSize16Weight600UnderLineBlush,
                      ),
                    )
                  ],
                ),
                const Gap(50),
              ],
            ),
          );
        },
      ),
    );
  }
}
