import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonType { filled, outline, transparent }

enum ButtonSize { little, small, large, largeIcon, block }

const _buttonSizes = {
  ButtonSize.little: Size(99.0, 32.0),
  ButtonSize.small: Size(146.0, 32.0),
  ButtonSize.large: Size(178.0, 48.0),
  ButtonSize.largeIcon: Size(247.0, 48.0),
  ButtonSize.block: Size(327.0, 48.0),
};

@immutable
class FAB extends StatelessWidget {
  final String text;
  final Widget? icon;
  final bool isActive;
  final bool isLoading;
  final bool iconView;

  final Color textColor;
  final Color backgroundColor;

  final ButtonType buttonType;
  final ButtonSize buttonSize;

  final void Function() onTap;

  const FAB({
    Key? key,
    required this.text,
    this.icon,
    this.isActive = true,
    this.isLoading = false,
    this.iconView = false,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonType,
    required this.buttonSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonSizes = _buttonSizes[buttonSize]!;

    return GestureDetector(
      onTap: () {
        if (!isLoading) {
          onTap();
        }
      },
      child: Container(
        width: buttonSizes.width,
        height: buttonSizes.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: buttonType == ButtonType.outline
              ? Border.all(
                  color: textColor,
                )
              : null,
          borderRadius: BorderRadius.circular(48.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconView) icon!,
            if (iconView) SizedBox(width: 8),
            Center(
              child: isLoading
                  ? SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: CircularProgressIndicator(
                        color: textColor,
                      ),
                    )
                  : Text(text,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
