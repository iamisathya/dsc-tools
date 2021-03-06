import 'package:dsc_tools/models/country_info.dart';
import 'package:get/get.dart';

import '../models/menu_option_model.dart';

class Globals {
  Globals._();
  static const String defaultLanguage = 'en';
//List of languages that are supported.  Used in selector.
//Follow this plugin for translating a google sheet to languages
//https://github.com/aloisdeniel/flutter_sheet_localization
//Flutter App translations google sheet
//https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit?usp=sharing

  static final List<MenuOptionsModel> languageOptions = [
    MenuOptionsModel(title: "English", value: "en"), //English
    MenuOptionsModel(title: "Thai", value: "th"), //Thai
  ];

  static final RxList<MenuOptionsModel> openPoMonths = [
    MenuOptionsModel(title: "month6", value: "6"), //English
    MenuOptionsModel(title: "monthall", value: "12"), //Thai
  ].obs;

  static Markets? currentMarket;
  static String currency = "";
}
