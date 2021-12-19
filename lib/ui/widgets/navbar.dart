import 'package:bavito/ui/widgets/navbar_item.dart';
import 'package:flutter/material.dart';

@immutable
class NavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<NavBarItemModel> items;
  final void Function(int) onSelect;

  const NavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onSelect,
  })  : assert(selectedIndex < items.length),
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (int i = 0; i < items.length; i++)
              Flexible(
                child: NavBarItemWidget(
                  isSelected: selectedIndex == i,
                  data: items[i],
                  onSelect: () => onSelect(i),
                ),
              ),
          ],
        ),
      );
}
