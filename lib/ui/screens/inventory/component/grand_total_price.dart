import 'package:dsc_tools/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/globals.dart';
import '../../../../utilities/extensions.dart';

class GrandTotal extends StatelessWidget {
  final String totalPrice;
  final String totalPv;

  const GrandTotal({required this.totalPrice, required this.totalPv});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.cadetBlue,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColor.kWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(3.0))),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  child: Text(
                    "Grand Total Price:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColor.kBlackColor),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  child: Text(
                    "${totalPrice.format()} ${Globals.currency}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColor.kBlackColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              decoration: const BoxDecoration(
                  color: AppColor.kWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 13),
                    child: Text(
                      "Grand Total PV:",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: AppColor.kBlackColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 13),
                    child: Text(
                      "$totalPv PV",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: AppColor.kBlackColor),
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
