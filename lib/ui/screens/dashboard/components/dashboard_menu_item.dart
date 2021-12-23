import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utilities/enums.dart';
import '../../../../utilities/user_session.dart';
import '../../../global/theme/text_view.dart';
import '../../login/login.screen.dart';

class DashboardMenuItem extends StatelessWidget {
  // final DashboardController controller = Get.put(DashboardController());
  const DashboardMenuItem({Key? key, required this.item}) : super(key: key);

  final DashboardMenuItemModel item;

  void onLogout() {
    FirebaseAnalytics()
        .logEvent(name: 'log_out', parameters: {'type': "normal_signout"});
    UserSessionManager.shared.removeUserInfoFromDB();
    Get.offAll(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          item.page == "onLogout" ? onLogout() : Get.toNamed(item.page),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: Container(
                height: 45,
                width: 45,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: item.color),
                child: SizedBox(
                    child: SvgPicture.asset(item.icon,
                        height: 10, width: 10, fit: BoxFit.scaleDown)),
              ),
            ),
            Expanded(
              child: Obx(() => AppText(
                  text: item.title.tr, style: TextTypes.bodyText1, maxLines: 2)),
            )
          ],
        ),
      ),
    );
  }
}

class DashboardMenuItemModel {
  // final DashboardController controller = Get.put(DashboardController());
  const DashboardMenuItemModel(
      {required this.title,
      required this.color,
      required this.page,
      required this.icon});

  final String title;
  final Color color;
  final String icon;
  final String page;
}
