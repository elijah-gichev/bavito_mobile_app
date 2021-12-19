import 'dart:ui';

import 'package:bavito/models/good.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/fab.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodPage extends StatefulWidget {
  final Good good;

  const GoodPage({
    Key? key,
    required this.good,
  }) : super(key: key);

  @override
  State<GoodPage> createState() => _GoodPageState();
}

class _GoodPageState extends State<GoodPage> {
  bool switchDescription = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FAB(
        text: 'Предложить обмен',
        textColor: CustomColors.white,
        backgroundColor: CustomColors.green,
        buttonType: ButtonType.outline,
        buttonSize: ButtonSize.largeIcon,
        icon: Icon(
          Icons.swap_horiz,
          size: 24.h,
          color: CustomColors.lightGreen,
        ),
        iconView: true,
        onTap: () {},
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Stack(
                  children: [
                    Center(
                      child: Image.network(
                        widget.good.imgSrc,
                        width: double.infinity,
                        height: 232,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 12),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: CustomColors.white,
                            borderRadius: BorderRadius.circular(48.0),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: CustomColors.green,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 28),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.good.title,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height: 16.h),
                                    Text(
                                      widget.good.owner.name +
                                          ' ' +
                                          widget.good.owner.surname,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              // InkWell(
                              //   onTap: widget.onTabMap,
                              //   child: SvgPicture.asset(
                              //     'assets/services/card_service.svg',
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            const SizedBox(width: 4),
                            Text(
                              widget.good.owner.phone,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'PRICE: ${widget.good.pricePoints}',
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: CustomColors.green),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 12),
                  child: Text(
                    widget.good.description,
                    maxLines: widget.good.description.length,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
