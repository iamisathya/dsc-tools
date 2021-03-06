import 'dart:ui' as ui;

import 'package:dsc_tools/models/country_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/globals.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  final language = "".obs;
  final store = GetStorage();

  // fallbackLocale saves the day when the locale gets in trouble
  Locale get fallbackLocale => const Locale('en', 'US');

  String get currentLanguage => language.value;

  Languages get currentOption => Globals.currentMarket!.languages
      .firstWhere((element) => element.value == language.value);

  @override
  void onReady() {
    setInitialLocalLanguage();
    super.onInit();
  }

  // Retrieves and Sets language based on device settings
  void setInitialLocalLanguage() {
    if (currentLanguageStore.value == '') {
      String _deviceLanguage = ui.window.locale.toString();
      _deviceLanguage =
          _deviceLanguage.substring(0, 2); //only get 1st 2 characters
      debugPrint(_deviceLanguage);
      updateLanguage(_deviceLanguage);
    }
  }

// Gets current language stored
  RxString get currentLanguageStore {
    language.value = store.read('language') ?? '';
    return language;
  }

  // gets the language locale app is set to
  Locale? get getLocale {
    if (currentLanguageStore.value == '') {
      language.value = Globals.defaultLanguage;
      updateLanguage(Globals.defaultLanguage);
    } else if (currentLanguageStore.value != '') {
      //set the stored string country code to the locale
      return Locale(currentLanguageStore.value);
    }
    // gets the default language key for the system.
    return Get.deviceLocale;
  }

// updates the language stored
  Future<void> updateLanguage(String value) async {
    language.value = value;
    await store.write('language', value);
    if (getLocale != null) {
      Get.updateLocale(getLocale!);
    }
    update();
  }
}
