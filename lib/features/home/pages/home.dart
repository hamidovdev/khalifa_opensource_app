import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/routes/basket_route.dart';
import 'package:khalifa/core/routes/history_route.dart';
import 'package:khalifa/core/routes/likes_route.dart';
import 'package:khalifa/core/routes/profile_route.dart';
import 'package:khalifa/core/routes/shopping_route.dart';
import 'package:khalifa/features/home/bloc/bloc/home_bloc.dart';
import 'package:khalifa/features/home/widgets/bottomNavigationBarWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var index = 0;
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: const [
                    Navigator(
                      onGenerateRoute: ShoppingRoute.onGenerateRoute,
                      observers: [],
                    ),
                    Navigator(
                      onGenerateRoute: LikesRoute.onGenerateRoute,
                      observers: [],
                    ),
                    Navigator(
                      onGenerateRoute: BasketRoute.onGenerateRoute,
                      observers: [],
                    ),
                    Navigator(
                      onGenerateRoute: HistoryRoute.onGenerateRoute,
                      observers: [],
                    ),
                    Navigator(
                      onGenerateRoute: ProfileRoute.onGenerateRoute,
                      observers: [],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: context.colors.whitishDark.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 12,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BnbWidget(
                      icon: context.icons.home,
                      index: 0,
                      onTap: () {
                        index = 0;
                        pageController!.jumpToPage(index);
                        context
                            .read<HomeBloc>()
                            .add(ChangeActiveIndex(index: index));
                      },
                      title: "home",
                    ),
                    BnbWidget(
                      icon: context.icons.likes,
                      index: 1,
                      onTap: () {
                        index = 1;
                        pageController!.jumpToPage(index);

                        context
                            .read<HomeBloc>()
                            .add(ChangeActiveIndex(index: index));
                      },
                      title: "likes",
                    ),
                    BnbWidget(
                      icon: context.icons.basket,
                      index: 2,
                      onTap: () {
                        index = 2;
                        pageController!.jumpToPage(index);

                        context
                            .read<HomeBloc>()
                            .add(ChangeActiveIndex(index: index));
                      },
                      title: "basket",
                    ),
                    BnbWidget(
                      icon: context.icons.history,
                      index: 3,
                      onTap: () {
                        index = 3;
                        pageController!.jumpToPage(index);

                        context
                            .read<HomeBloc>()
                            .add(ChangeActiveIndex(index: index));
                      },
                      title: "history",
                    ),
                    BnbWidget(
                      icon: context.icons.profile,
                      index: 4,
                      onTap: () {
                        index = 4;
                        pageController!.jumpToPage(index);

                        context
                            .read<HomeBloc>()
                            .add(ChangeActiveIndex(index: index));
                      },
                      title: "profile",
                    ),
                  ],
                ),
              )
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () async {
          //     final headers = {
          //       'Authorization':
          //           'Token ${ins<SharedPreferences>().getString("token")}',
          //     };
          //     print("Header = \n $headers");
          //     final ui = await ins<Dio>().post("$baseurl/auth/logout",
          //         options: Options(headers: headers));
          //     print("Ui  ===== $ui");
          //     print(
          //         "Token ************************** ${ins<SharedPreferences>().getString("token")}");
          //     await ins<SharedPreferences>().remove("token");
          //     print(
          //         "Token ************************** ${ins<SharedPreferences>().getString("token")}");
          //   },
          // ),
        );
      },
    );
  }
}
