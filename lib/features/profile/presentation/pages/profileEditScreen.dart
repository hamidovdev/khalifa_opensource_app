import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/widgets/w_button.dart';
import 'package:khalifa/core/widgets/w_textfield.dart';
import 'package:khalifa/features/profile/data/model/model.dart';
import 'package:khalifa/features/profile/presentation/bloc/profile_bloc.dart';

class ProfileEditScreen extends StatefulWidget {
  final ProfileModel user;
  const ProfileEditScreen({
    super.key,
    required this.user,
  });

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController telegramUsernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProfileModel user = widget.user;
    fullNameController.text = user.fullName ?? "";
    phoneController.text = user.phone ?? "";
    telegramUsernameController.text = user.telegramUsername ?? "";
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: ListView(
              children: [
                const Gap(20),
                Text(
                  "full_name".tr(),
                  style: context.style.fontSize16Weight500Dark,
                ),
                const Gap(5),
                WTextField(
                  controller: fullNameController,
                  fillColor: context.colors.white,
                  keyBoardType: TextInputType.name,
                ),
                const Gap(20),
                Text(
                  "phone_number".tr(),
                  style: context.style.fontSize16Weight500Dark,
                ),
                const Gap(5),
                WTextField(
                  controller: phoneController,
                  fillColor: context.colors.white,
                  keyBoardType: TextInputType.phone,
                ),
                Gap(20),
                Text(
                  "telegram_username".tr(),
                  style: context.style.fontSize16Weight500Dark,
                ),
                const Gap(5),
                WTextField(
                  controller: telegramUsernameController,
                  fillColor: context.colors.white,
                  keyBoardType: TextInputType.name,
                ),
                const Gap(50),
                WButton(
                  onTap: () {
                    context.read<ProfileBloc>().add(
                          UpdateUserInfoEvent(
                            user: ProfileModel(
                              email: user.email,
                              fullName: fullNameController.text,
                              phone: phoneController.text,
                              telegramUsername: telegramUsernameController.text,
                            ),
                            failure: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Container(
                                    alignment: Alignment.center,
                                    child: const Text("Malumotlar qo'shilmadi"),
                                  ),
                                ),
                              );
                            },
                            success: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                  },
                  borderRadius: 12,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "update".tr(),
                    style: context.style.fontSize16Weight500White,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
