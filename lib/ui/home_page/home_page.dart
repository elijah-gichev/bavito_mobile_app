import 'package:bavito/models/good.dart';
import 'package:bavito/models/user.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/all_goods/all_goods.dart';
import 'package:bavito/ui/exchange_page/exchange_page.dart';
import 'package:bavito/ui/good_page/good_page.dart';
import 'package:bavito/ui/new_good/new_good.dart';
import 'package:bavito/ui/profile/profile_page.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/good_item.dart';
import 'package:bavito/ui/widgets/navbar.dart';
import 'package:bavito/ui/widgets/navbar_item.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

@immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final _items = [
    const NavBarItemModel(
      iconData: Icons.list,
      label: 'Все товары',
    ),
    const NavBarItemModel(
      iconData: Icons.add,
      label: ' Создать',
    ),
    const NavBarItemModel(
      iconData: Icons.swap_horiz,
      label: ' Обмены',
    ),
    const NavBarItemModel(
      iconData: Icons.home,
      label: 'Профиль',
    ),
  ];

  final goods = [
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1(),
    Good.sample1()
  ];

  late final PersistentTabController _controller;

  void _controllerListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController()..addListener(_controllerListener);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_controllerListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.custom(
      context,
      controller: _controller,
      itemCount: _items.length,
      screens: [
        AllGoods(),
        const NewGood(),
        ExchangePage(),
        ProfilePage(
          goods: goods,
          user: User.sample2(),
        ),
      ],
      hideNavigationBarWhenKeyboardShows: false,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 350),
      ),
      customWidget: NavBarWidget(
        selectedIndex: _controller.index,
        items: _items,
        onSelect: (selectedIndex) => _controller.index = selectedIndex,
      ),
    );
  }
}
