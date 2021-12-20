import 'package:bavito/resources/colors.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class BigTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;

  const BigTextField({
    Key? key,
    this.textEditingController,
    this.onChanged,
  }) : super(key: key);

  @override
  _BigTextFieldState createState() => _BigTextFieldState();
}

class _BigTextFieldState extends State<BigTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 204.h,
      child: TextField(
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.h),
          hintText: 'Здесь должно быть описание...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: CustomColors.lightGreen,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: CustomColors.lightGreen,
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 15.h,
          ),
        ),
      ),
    );
  }
}
