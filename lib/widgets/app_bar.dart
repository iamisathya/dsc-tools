import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/values/colors.dart';

class AppBar extends StatelessWidget {
  final String text;

  const AppBar({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: AppColor.kBlackColor),
      ),
    );
  }
}