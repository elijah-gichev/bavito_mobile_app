import 'package:bavito/models/good.dart';
import 'package:bavito/ui/good_page/good_page.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class GoodItem extends StatelessWidget {
  final Good good;

  double? elevation;

  GoodItem(
    this.good, {
    this.elevation,
    Key? key,
  }) : super(key: key);

  void navigateToGood(BuildContext context, {required Good good}) {
    pushNewScreen(
      context,
      screen: GoodPage(
        good: good,
      ),
      pageTransitionAnimation: PageTransitionAnimation.rotate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToGood(
          context,
          good: good,
        );
      },
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.network(
                  good.imgSrc,
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                good.title,
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8.h),
              Text(
                "price: ${good.pricePoints}",
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
