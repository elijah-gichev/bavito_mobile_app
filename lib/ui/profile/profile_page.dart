import 'package:bavito/main.dart';
import 'package:bavito/models/good.dart';
import 'package:bavito/models/user.dart';
import 'package:bavito/network/goods_network.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/services/dio_service.dart';
import 'package:bavito/services/user_service.dart';
import 'package:bavito/ui/auth/login.dart';
import 'package:bavito/ui/profile/cubit/my_goods_cubit.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/fab.dart';
import 'package:bavito/ui/widgets/good_item.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyGoodsCubit(
        GoodsNetwork(
          getIt<DioService>(),
        ),
      )..loadMyGoods(),
      child: ChangeNotifierProvider.value(
        value: getIt<UserService>(),
        child: const ProfilePageView(),
      ),
    );
  }
}

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({
    Key? key,
  }) : super(key: key);

  Widget _generateCredentialsBlock(BuildContext context) {
    final logged = context.watch<UserService>().hasUser;
    final user = context.watch<UserService>().user;
    if (logged) {
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.name + ' ' + user.surname,
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
          ),
          Spacer(),
          FAB(
            text: 'Выйти',
            textColor: CustomColors.white,
            backgroundColor: CustomColors.green,
            icon: Icon(
              Icons.swap_horiz,
              size: 28.h,
              color: CustomColors.lightGreen,
            ),
            iconView: true,
            onTap: () {
              context.read<UserService>().deleteUser();
            },
            buttonType: ButtonType.outline,
            buttonSize: ButtonSize.small,
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
            navigateToLogin(context);
          },
          buttonType: ButtonType.outline,
          buttonSize: ButtonSize.small,
        ),
      );
    }
  }

  void navigateToLogin(BuildContext context) {
    pushNewScreen(
      context,
      screen: const LoginScreen(),
      pageTransitionAnimation: PageTransitionAnimation.scaleRotate,
    ).then(
      (value) => context.read<MyGoodsCubit>().loadMyGoods(),
    );
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
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 28.h,
              ),
              _generateCredentialsBlock(context),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<MyGoodsCubit, MyGoodsState>(
                builder: (context, state) {
                  if (state is MyGoodsLoadingDone) {
                    final goods = state.goods;
                    return Expanded(
                      child: GridView.builder(
                        itemCount: goods.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final good = goods[index];
                          return Container(
                            padding:
                                EdgeInsets.only(bottom: 10.0.h, right: 10.w),
                            child: GoodItem(
                              good,
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    );
                  } else if (state is MyGoodsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: Text('Что-то пошло не так!'),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
