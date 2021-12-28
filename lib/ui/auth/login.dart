// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:bavito/main.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/services/user_service.dart';
import 'package:bavito/ui/auth/bloc/login/login_bloc.dart';
import 'package:bavito/ui/auth/registration.dart';
import 'package:bavito/ui/auth/widgets/titled_text_field.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            getIt<UserService>(),
          ),
        ),
      ],
      child: LoginScreenView(),
    );
  }
}

class LoginScreenView extends StatelessWidget {
  LoginScreenView({Key? key}) : super(key: key);

  final emailTextController = TextEditingController();
  final pwdTextController = TextEditingController();

  void navigateToRegistration(BuildContext context) {
    pushNewScreen(
      context,
      screen: const Registration(),
      withNavBar: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 27),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
            color: CustomColors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Войти',
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(state.errorMsg),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }

          if (state is LoginDone) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 40),
                TitledTextField(
                  hintText: 'Почта',
                  subTitle: 'Email',
                  contoller: emailTextController,
                ),
                const SizedBox(height: 16),
                TitledTextField(
                  hintText: 'Пароль',
                  subTitle: 'Пароль',
                  canBeObscured: true,
                  contoller: pwdTextController,
                ),
                const SizedBox(height: 24),
                FAB(
                  text: 'Войти',
                  textColor: CustomColors.white,
                  backgroundColor: CustomColors.green,
                  buttonType: ButtonType.filled,
                  buttonSize: ButtonSize.block,
                  onTap: () {
                    final emailValue = emailTextController.text;
                    final pwd = pwdTextController.text;

                    context.read<LoginBloc>().add(
                          LoginAttempted(emailValue, pwd),
                        );
                  },
                ),
                const SizedBox(height: 24),
                if (state is LoginInProgress)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                const Spacer(),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Нет аккаунта?',
                      style: TextStyle(
                        color: CustomColors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(width: 2),
                    GestureDetector(
                      onTap: () {
                        navigateToRegistration(context);
                      },
                      child: const Text(
                        'Зарегистрируйтесь',
                        style: TextStyle(
                          color: CustomColors.green,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          );
        },
      ),
    );
  }
}
