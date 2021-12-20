import 'package:bavito/models/good.dart';
import 'package:bavito/models/user.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/good_item.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<Good> goods;
  final User user;

  const ProfilePage({
    Key? key,
    required this.goods,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfilePageView(
      goods: goods,
      user: user,
    );
  }
}

class ProfilePageView extends StatelessWidget {
  final List<Good> goods;
  final User user;

  const ProfilePageView({
    required this.goods,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Профиль',
          style: TextStyle(
            color: CustomColors.green,
            fontSize: 18.h,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 28.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name + ' ' + user.surname,
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 20.h,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  user.phone,
                  style: TextStyle(
                    color: CustomColors.grey,
                    fontSize: 13.h,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: goods.length,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final good = goods[index];
                  return Container(
                    padding: EdgeInsets.only(bottom: 10.0.h, right: 10.w),
                    child: GoodItem(good),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
