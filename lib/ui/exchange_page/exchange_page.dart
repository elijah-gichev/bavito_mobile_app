import 'package:bavito/models/good.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/good_item.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Товар',
          style: TextStyle(
            color: CustomColors.green,
            fontSize: 18.h,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              ExchangeItem(
                fromGood: Good.sample1(),
                toGood: Good.sample2(),
                myExchange: false,
              ),
              ExchangeItem(
                fromGood: Good.sample2(),
                toGood: Good.sample1(),
                myExchange: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExchangeItem extends StatelessWidget {
  final Good fromGood;
  final Good toGood;

  final bool myExchange;

  const ExchangeItem({
    Key? key,
    required this.fromGood,
    required this.toGood,
    required this.myExchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GoodItem(fromGood),
        Container(
          width: 60,
          height: 60,
          child: myExchange
              ? const FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.east,
                    color: CustomColors.green,
                  ),
                )
              : const RotatedBox(
                  quarterTurns: 2,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.east,
                      color: CustomColors.red,
                    ),
                  ),
                ),
        ),
        GoodItem(toGood),
      ],
    );
  }
}
