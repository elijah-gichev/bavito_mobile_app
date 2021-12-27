import 'package:bavito/models/good.dart';
import 'package:bavito/models/user.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/fab.dart';
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

  Widget _generateCredentialsBlock() {
    final logged = false;
    if (logged) {
      return Column(
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
          SizedBox(
            height: 5.h,
          ),
          Text(
            user.email,
            style: TextStyle(
              color: CustomColors.grey,
              fontSize: 13.h,
            ),
          ),
        ],
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: FAB(
          text: 'Войти',
          textColor: CustomColors.white,
          backgroundColor: CustomColors.green,
          icon: Icon(
            Icons.swap_horiz,
            size: 28.h,
            color: CustomColors.lightGreen,
          ),
          iconView: true,
          onTap: () {
            // go to login page
          },
          buttonType: ButtonType.outline,
          buttonSize: ButtonSize.small,
        ),
      );
    }
  }

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
            _generateCredentialsBlock(),
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
                    child: GoodItem(
                      good,
                    ),
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
