import 'package:bavito/models/good.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class GoodItem extends StatelessWidget {
  final Good good;
  final GestureTapCallback onTap;
  const GoodItem({
    Key? key,
    required this.good,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.network(
                  good.imgSrc,
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.fill,
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
            ],
          ),
        ),
      ),
    );
  }
}
