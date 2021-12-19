import 'package:bavito/models/good.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/good_item.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class ExchangeItemModel {
  final Good fromGood;
  final Good toGood;
  final bool myExchange;

  ExchangeItemModel({
    required this.fromGood,
    required this.toGood,
    required this.myExchange,
  });
}

class ExchangePage extends StatefulWidget {
  ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  var exchangeItemModels = [
    ExchangeItemModel(
      fromGood: Good.sample1(),
      toGood: Good.sample2(),
      myExchange: false,
    ),
    ExchangeItemModel(
      fromGood: Good.sample2(),
      toGood: Good.sample1(),
      myExchange: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Обмены',
          style: TextStyle(
            color: CustomColors.green,
            fontSize: 18.h,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView.builder(
            itemCount: exchangeItemModels.length,
            itemBuilder: (context, index) {
              final exchangeItemModel = exchangeItemModels[index];

              return Dismissible(
                key: Key(
                    "${exchangeItemModel.fromGood.id}  ${exchangeItemModel.toGood.id}"),
                onDismissed: (direction) {
                  print(direction);
                  setState(() {
                    exchangeItemModels.removeAt(index);
                  });
                  //TODO deleting
                },
                background: Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Удали меня!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Не удаляй меня!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                child: ExchangeItem(exchangeItemModel),
              );
            }),
      ),
    );
  }
}

class ExchangeItem extends StatelessWidget {
  final ExchangeItemModel exchangeItemModel;

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
            Text('so long comment...so long comment...so long comment'
                'so long comment...so long comment...so long comment'
                'so long comment...so long comment...so long comment'
                'so long comment...so long comment...so long comment'
                'so long comment...so long comment...so long comment'
                'so long comment...so long comment...so long comment'),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
