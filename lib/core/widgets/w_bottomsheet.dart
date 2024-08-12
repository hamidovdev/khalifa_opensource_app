import 'package:flutter/material.dart';

class WBottomSheet extends StatelessWidget {
  final double borderRadius;
  final List<Widget> children;
  final List<Widget>? headerChildren;
  final Widget? bottomNavigation;
  final double? height;
  final EdgeInsets? contentPadding;
  final EdgeInsets? bottomNavigationPadding;
  final bool isScrollable;
  final String title;

  const WBottomSheet({
    required this.children,
    this.borderRadius = 12,
    this.isScrollable = false,
    this.height,
    this.bottomNavigation,
    this.contentPadding,
    this.headerChildren,
    this.bottomNavigationPadding,
    this.title = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(
            0, 13, 0, MediaQuery.of(context).viewInsets.bottom),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(borderRadius),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 78,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            Container(
              padding: contentPadding ??
                  EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    MediaQuery.of(context).padding.bottom + 16,
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ],
        ),
      );
}
