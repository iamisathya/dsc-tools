import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/language_controller.dart';
import '../../../../../data/provider/globals.dart';
import '../../../../core/values/colors.dart';
import '../../../../data/model/country_info.dart';
import '../../../../routes/app_pages.dart';

class AppBarController extends GetxController {
  final LanguageController languageController = Get.put(LanguageController());

  Future<void> showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 105, 0, 100),
      items: Globals.currentMarket!.languages
          .map((lang) => PopupMenuItem<String>(
                child: ListTile(
                  onTap: () => onSelectLanguage(lang, context),
                  title: Text(lang.title,
                      style: TextStyle(
                          color: languageController.currentOption.value ==
                                  lang.value
                              ? AppColor.dodgerBlue
                              : AppColor.kBlackColor)),
                ),
              ))
          .toList(),
      elevation: 8.0,
    );
  }

  Future<void> onSelectLanguage(Languages option, BuildContext context) async {
    await languageController.updateLanguage(option.iso);
    Navigator.of(context).pop();
    Get.forceAppUpdate();
  }

  void onPressNotification() {
    Get.toNamed(Routes.NOTIFICATIONS);
  }
}