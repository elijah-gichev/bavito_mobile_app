import 'package:bavito/models/exchange.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/exchange_page/exchange_item.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class ExchangePage extends StatefulWidget {
  ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  var exchangeItemModels = [
    Exchange.sample1(),
    Exchange.sample2(),
    Exchange.sample1(),
    Exchange.sample2(),
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
              final exchange = exchangeItemModels[index];

              return Dismissible(
                key: Key("${exchange.fromGood.id}  ${exchange.toGood.id}"),
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
                child: ExchangeItem(exchange),
              );
            }),
      ),
    );
  }
}
