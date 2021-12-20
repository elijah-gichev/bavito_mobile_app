import 'package:bavito/resources/colors.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitledTextField extends StatefulWidget {
  final bool canBeObscured;
  final String? hintText;
  final String? subTitle;
  final bool isError;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final TextEditingController? contoller;
  final bool readOnly;

  final List<TextInputFormatter>? inputFormatters;

  const TitledTextField({
    Key? key,
    bool? readOnly,
    bool? canBeObscured,
    this.subTitle,
    this.onChanged,
    this.inputType,
    this.contoller,
    this.hintText,
    this.isError = false,
    this.inputFormatters,
  })  : readOnly = readOnly ?? false,
        canBeObscured = canBeObscured ?? false,
        super(key: key);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<TitledTextField> {
  late final TextEditingController _controller;
  late String _currentValue;
  void _toggleObscure() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  late final FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _controller = widget.contoller ?? TextEditingController();
    _currentValue = _controller.text;
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextField(
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        controller: _controller,
        style: TextStyle(
          color: CustomColors.black,
          fontSize: 16.h,
          fontFamily: 'Roboto',
        ),
        cursorColor: Colors.black,
        keyboardType: widget.inputType,
        focusNode: _focusNode,
        onEditingComplete: FocusScope.of(context).nextFocus,
        obscureText: widget.canBeObscured ? _obscured : false,
        decoration: InputDecoration(
          constraints: BoxConstraints(minHeight: 48.h),
          suffixIcon: widget.canBeObscured
              ? GestureDetector(
                  onTap: _toggleObscure,
                  child: Icon(
                    _obscured ? Icons.visibility : Icons.visibility_off,
                    color: CustomColors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(
            left: 15.w,
            top: 10.h,
            bottom: 10.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: CustomColors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: CustomColors.green,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: CustomColors.grey,
            fontSize: 16.h,
          ),
          label: widget.subTitle != null
              ? Text(
                  widget.subTitle!,
                  style: const TextStyle(
                    color: CustomColors.green,
                  ),
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
