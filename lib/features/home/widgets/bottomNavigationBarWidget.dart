import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/features/home/bloc/bloc/home_bloc.dart';

class BnbWidget extends StatelessWidget {
  final int index;
  final String icon;
  final String title;
  final Function() onTap;
  const BnbWidget({
    super.key,
    required this.icon,
    required this.index,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            Color color = state.activeIndex == index
                ? context.colors.dark1
                : context.colors.dark1.withOpacity(0.4);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Gap(8),
                SvgPicture.asset(
                  icon,
                  color: color,
                ),
                Gap(7),
                Text(
                  title.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
