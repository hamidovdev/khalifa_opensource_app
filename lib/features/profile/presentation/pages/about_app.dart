import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/app_texts/app_texts.dart';
import 'package:khalifa/core/extensions/extensions.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'about_the_app'.tr(),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              about_app_text1,
              style: context.style.fontSize16Weight400WhitishDark,
            )
          ],
        ),
      ),
    );
  }
}
