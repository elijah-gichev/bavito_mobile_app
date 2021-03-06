import 'dart:ui';

import 'package:bavito/models/good.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/fab.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodPage extends StatefulWidget {
  final Good good;
  final VoidCallback? onChooseItem;

  const GoodPage({
    Key? key,
    required this.good,
    this.onChooseItem,
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
          'Товар',
          style: TextStyle(
            color: CustomColors.green,
            fontSize: 18.h,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PRICE: ${widget.good.pricePoints}',
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: const TextStyle(color: CustomColors.green),
                            ),
                            if (!widget.good.isMy)
                              FAB(
                                text: 'Предложить обмен',
                                textColor: CustomColors.white,
                                backgroundColor: CustomColors.green,
                                buttonType: ButtonType.outline,
                                buttonSize: ButtonSize.largeIcon,
                                icon: Icon(
                                  Icons.swap_horiz,
                                  size: 28.h,
                                  color: CustomColors.lightGreen,
                                ),
                                iconView: true,
                                onTap: () {
                                  if (widget.onChooseItem != null) {
                                    widget.onChooseItem!();
                                  }
                                },
                              ),
                          ],
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
