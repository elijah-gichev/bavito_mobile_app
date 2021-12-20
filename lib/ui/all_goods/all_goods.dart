import 'package:bavito/models/good.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/good_item.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class AllGoods extends StatelessWidget {
  AllGoods({Key? key}) : super(key: key);

  final goods = [
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Все товары',
          style: TextStyle(
            color: CustomColors.green,
            fontSize: 18.h,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: GridView.builder(
        physics: const ScrollPhysics(),
        itemCount: goods.length,
        itemBuilder: (BuildContext context, int index) {
          final good = goods[index];
          return Container(
            padding: EdgeInsets.only(bottom: 10.0.h, right: 10.w),
            child: GoodItem(good),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
