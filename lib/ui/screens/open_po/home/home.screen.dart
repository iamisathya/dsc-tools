import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../navigation/navigation_drawer.dart';
import '../../../../utilities/constants.dart';
import '../../../global/widgets/transparent_app_bar.dart';
import '../controller/openpo.controller.dart';
import 'components/body.dart';

class OpenPOHomeScreen extends StatelessWidget {
  final OpenPoController controller = Get.put(OpenPoController());
  static const String routeName = '/openPOHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "list_po".tr,
          action: _renderActionBar(context),
        ),
        drawer: NavigationDrawer(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            heroTag: "add_open_po_order",
            onPressed: controller.onAddOrderTap,
            child: const Icon(Icons.add)));
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.sort,
        ),
        tooltip: 'Sort types',
        onPressed: () => controller.showPopupMenu(context),
      ),
    ];
  }
}
