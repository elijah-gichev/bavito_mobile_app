import 'package:bavito/models/good.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/new_exchange_page/new_exchange_comment.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/good_item.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class NewExchangePage extends StatelessWidget {
  final goods = [
    Good.sample2(),
    Good.sample2(),
    Good.sample2(),
    Good.sample2(),
    Good.sample2()
  ];

  NewExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 27),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16.h,
            ),
            color: CustomColors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Новый обмен',
          style: TextStyle(
            color: CustomColors.green,
            fontSize: 18.h,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: goods.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final good = goods[index];
          return Container(
            padding: EdgeInsets.only(bottom: 10.0.h, right: 10.w),
            child: GoodItem(
              good,
              onTap: () {
                showNewExchangeComment(
                  context,
                  onSubmitPressed: () {},
                );
              },
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
