import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class StepDescription extends StatelessWidget {
  final String description;

  const StepDescription({
    Key? key,
    required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 338.w,
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.h,
        ),
      ),
    );
  }
}
