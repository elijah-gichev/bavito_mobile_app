import 'package:bavito/models/good.dart';
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
        // MainScreen(), all goods
        // NewGoodScreen(),
        // AllRequestsScreen(),
        // ProfileScreen(),
        MainScreen(), MainScreen(), MainScreen(), MainScreen(),
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

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  void navigateToGood(BuildContext context) {
    pushNewScreen(
      context,
      screen: MainScreen(),
      withNavBar: false,
    );
  }

  final goods = [
    Good.sample(),
    Good.sample(),
    Good.sample(),
    Good.sample(),
    Good.sample()
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: goods.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final good = goods[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10.0.h, right: 10.w),
          child: GoodItem(
            good: good,
            onTap: () {
              navigateToGood(context);
            },
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
