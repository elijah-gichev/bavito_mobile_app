import 'package:bavito/resources/colors.dart';
import 'package:flutter/material.dart';

@immutable
class NavBarItemWidget extends StatelessWidget {
  final bool isSelected;
  final NavBarItemModel data;
  final void Function() onSelect;

  const NavBarItemWidget({
    Key? key,
    required this.isSelected,
    required this.data,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? CustomColors.green : CustomColors.grey;

    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onSelect,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              data.iconData,
              color: color,
            ),
            const SizedBox(height: 6.0),
            Material(
              type: MaterialType.transparency,
              child: Text(
                data.label,
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItemModel {
  final IconData iconData;
  final String label;

  const NavBarItemModel({
    required this.iconData,
    required this.label,
  });
}
