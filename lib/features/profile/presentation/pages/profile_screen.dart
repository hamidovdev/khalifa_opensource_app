import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/route_names/profile_route_names.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/features/profile/data/model/model.dart';
import 'package:khalifa/features/profile/presentation/bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String language = "uz";
  DropListModel dropListModel = DropListModel([
    OptionItem(id: "1", title: "Uz", data: 'uz'),
    OptionItem(id: "2", title: "Ru", data: 'ru'),
    OptionItem(id: "3", title: "En", data: 'en'),
  ]);

  OptionItem optionItemSelected = OptionItem(title: "Language");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "profile".tr(),
          style: context.style.fontSize24Weight500DarkSpacing1,
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state.mainStatus) {
            case MainStatus.notfound:
              context.read<ProfileBloc>().add(GetUserInfoEvent());
              return const Center(
                child: CupertinoActivityIndicator(),
              );
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
              ProfileModel user = state.user!;
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProfileRouteNames.profileEditScreen,
                          arguments: user,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: context.colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: double.maxFinite,
                        height: MediaQuery.sizeOf(context).height / 100 * 10,
                        child: Row(
                          children: [
                            const Gap(15),
                            SizedBox(
                              width:
                                  MediaQuery.sizeOf(context).width / 100 * 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    user.fullName ?? user.email,
                                    style:
                                        context.style.fontSize25Weight500Dark,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                100 *
                                                30,
                                        child: Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            user.phone != null
                                                ? user.phone!
                                                : "+998 –– ––– –– ––",
                                            style: context
                                                .style.fontSize16Weight500Dark),
                                      ),
                                      const Gap(5),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                100 *
                                                48,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          user.email,
                                          style: context
                                              .style.fontSize16Weight500Dark,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Gap(15),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ProfileRouteNames.aboutApp,
                              );
                            },
                            child: Container(
                              width:
                                  MediaQuery.sizeOf(context).width / 100 * 45,
                              height:
                                  MediaQuery.sizeOf(context).height / 100 * 8,
                              decoration: BoxDecoration(
                                color: context.colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "about_the_app".tr(),
                                style: context.style.fontSize20Weight500Blush,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 100 * 45,
                            height: MediaQuery.sizeOf(context).height / 100 * 8,
                            child: DropdownButtonFormField(
                              icon: const SizedBox(),
                              isExpanded: true,
                              elevation: 0,
                              dropdownColor: Colors.white,
                              menuMaxHeight: 300,
                              style: context
                                  .style.fontSize16Weight500ColorDarkOpacity05,
                              hint: Text(
                                textAlign: TextAlign.center,
                                "Language",
                                style: context.style.fontSize20Weight500Blush,
                              ),
                              isDense: false,
                              itemHeight: 50,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: "uz",
                                  child: Text(
                                    'UZ',
                                    style: context.style
                                        .fontSize16Weight500ColorDarkOpacity05,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "ru",
                                  child: Text(
                                    'RU',
                                    style: context.style
                                        .fontSize16Weight500ColorDarkOpacity05,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "en",
                                  child: Text(
                                    'EN',
                                    style: context.style
                                        .fontSize16Weight500ColorDarkOpacity05,
                                  ),
                                ),
                              ],
                              onChanged: (value) async {
                                if (value == "uz") {
                                  await context.setLocale(
                                    const Locale("uz", "UZ"),
                                  );
                                } else if (value == "ru") {
                                  await context.setLocale(
                                    const Locale("ru", "RU"),
                                  );
                                } else {
                                  await context.setLocale(
                                    const Locale("en", "EN"),
                                  );
                                }
                                setState(() {});
                              },
                            ),
                          )
                          // Container(
                          //   alignment: Alignment.center,
                          //   width: MediaQuery.sizeOf(context).width / 100 * 45,
                          //   height: MediaQuery.sizeOf(context).height / 100 * 8,
                          //   decoration: BoxDecoration(
                          //     color: context.colors.white,
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: DropdownButton2(
                          //     isDense: false,
                          //     menuItemStyleData: const MenuItemStyleData(
                          //       customHeights: [
                          //         40,
                          //         40,
                          //         40,
                          //       ],
                          //     ),
                          //     value: language,
                          //     underline: const SizedBox(),
                          //     customButton: Text(
                          //       "language".tr(),
                          //       style: context.style.fontSize20Weight500Blush,
                          //     ),
                          //     items: [
                          //       DropdownMenuItem(
                          //         value: "uz",
                          //         child: Text(
                          //           "Uz",
                          //           style: context.style
                          //               .fontSize16Weight500ColorDarkOpacity05,
                          //         ),
                          //       ),
                          //       DropdownMenuItem(
                          //         value: "en",
                          //         child: Text(
                          //           "En",
                          // style: context.style
                          //     .fontSize16Weight500ColorDarkOpacity05,
                          //         ),
                          //       ),
                          //       DropdownMenuItem(
                          //         value: "ru",
                          //         child: Text(
                          //           "Ru",
                          //           style: context.style
                          //               .fontSize16Weight500ColorDarkOpacity05,
                          //         ),
                          //       ),
                          //     ],
                          //     onChanged: (value) async {
                          //       language = value!;
                          // if (value == "uz") {
                          //   await context
                          //       .setLocale(const Locale("uz", "UZ"));
                          // } else if (value == "ru") {
                          //   await context
                          //       .setLocale(const Locale("ru", "RU"));
                          // } else {
                          //   await context
                          //       .setLocale(const Locale("en", "EN"));
                          // }
                          //     },
                          //     dropdownStyleData: DropdownStyleData(
                          //       width: 54,
                          //       isOverButton: true,
                          //       decoration: BoxDecoration(
                          //         color: context.colors.white,
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    )
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
