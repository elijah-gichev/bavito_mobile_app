import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/new_good/controllers/aggregate_good_controller.dart';
import 'package:bavito/ui/new_good/fill_description/fill_description.dart';
import 'package:bavito/ui/new_good/fill_other/fill_other.dart';
import 'package:bavito/ui/new_good/controllers/fill_routing_controller.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewGood extends StatelessWidget {
  const NewGood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FillRoutingController(0),
        ),
        Provider(
          create: (_) => AggregateGoodController(),
        ),
      ],
      child: NewGoodView(),
    );
  }
}

class NewGoodView extends StatelessWidget {
  NewGoodView({Key? key}) : super(key: key);

  final pages = [
    FillDescription(),
    FillOther(
      onPressed: (_) {},
    ),
  ];

  String getAppBarTitle(BuildContext context) {
    final currentPage = context.watch<FillRoutingController>().currentIndex + 1;
    final amountPages = pages.length;

    final title = context.read<FillRoutingController>().currentTitle;

    final resTitle = '$currentPage/$amountPages: $title';
    return resTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          getAppBarTitle(context),
          style: TextStyle(
            color: CustomColors.green,
            fontSize: 20.h,
            fontFamily: 'Roboto',
          ),
        ),
        leading: context.watch<FillRoutingController>().currentIndex != 0
            ? Padding(
                padding: const EdgeInsets.only(left: 27),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 16.h,
                  ),
                  color: CustomColors.black,
                  onPressed: () {
                    context.read<FillRoutingController>().prevStep();
                  },
                ),
              )
            : null,
      ),
      body: pages[context.watch<FillRoutingController>().currentIndex],
    );
  }
}
