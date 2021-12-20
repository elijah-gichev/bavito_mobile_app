import 'package:bavito/models/exchange.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/good_item.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class ExchangeItem extends StatelessWidget {
  final Exchange exchangeItemModel;

  const ExchangeItem(
    this.exchangeItemModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GoodItem(
                  exchangeItemModel.fromGood,
                  elevation: 0,
                ),
                Column(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          Icons.east,
                          color: exchangeItemModel.myExchange
                              ? CustomColors.green
                              : CustomColors.red,
                        ),
                      ),
                    ),
                    Container(
                      width: 50.w,
                      height: 50.h,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Icon(
                            Icons.east,
                            color: exchangeItemModel.myExchange
                                ? CustomColors.red
                                : CustomColors.green,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                GoodItem(
                  exchangeItemModel.toGood,
                  elevation: 0,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(exchangeItemModel.comment),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
