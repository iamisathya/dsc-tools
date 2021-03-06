import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation/navigation_drawer.dart';
import '../../../utilities/constants.dart';
import '../../global/widgets/transparent_app_bar.dart';
import 'component/body.dart';
import 'controller/inventory.controller.dart';

class InventoryHomeScreen extends StatelessWidget {
  static const String routeName = '/inventoryHomePage';
  final InventoryController controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: TransAppBar(
          title: "Inventory",
          action: _renderActionBar(context),
        ),
        drawer: NavigationDrawer(),
        body: SafeArea(child: Body()));
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.open_in_new_outlined,
        ),
        tooltip: 'Export',
        onPressed: () {
          controller.onTapExportExcellSheet();
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.print_outlined,
        ),
        tooltip: 'Print',
        onPressed: () => controller.onTapPrint(context),
      ),
      IconButton(
        icon: const Icon(
          Icons.filter_alt_outlined,
        ),
        tooltip: 'Sort types',
        onPressed: () => controller.showPopupMenu(context),
      ),
    ];
  }
}
