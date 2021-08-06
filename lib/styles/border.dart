import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utilities/size_config.dart';

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

OutlineInputBorder kFocusedOutlineInputBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: kMainColor, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );
}

OutlineInputBorder kOutlineInputBorder() {
  return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)));
}

BorderSide kBorderSide({double w = 2.0, Color c = kMainColor}) =>
    BorderSide(color: c, width: w);

BorderRadius kBorderRadius({double w = 8.0}) =>
    BorderRadius.all(Radius.circular(w));

Border kBorderAll({double w = 2.0, Color c = kMainColor}) =>
    Border.all(color: c, width: w);

BoxDecoration kTableHeaderTileBox =
    BoxDecoration(color: kMainColor, border: Border.all(width: 0.5));
