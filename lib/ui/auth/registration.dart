// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:bavito/models/params_user_data_model.dart';
import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/auth/bloc/register/register_bloc.dart';
import 'package:bavito/ui/auth/widgets/titled_text_field.dart';
import 'package:bavito/ui/widgets/custom_app_bar.dart';
import 'package:bavito/ui/widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ],
      child: RegistrationView(),
    );
  }
}

class RegistrationView extends StatelessWidget {
  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final pwdTextController = TextEditingController();
  final repeatPwdTextController = TextEditingController();

  RegistrationView({Key? key}) : super(key: key);

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
          'Регистрация',
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterFailure) {
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

          if (state is RegisterDone) {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('Регистрация прошла успешно!'
                      'Для подтверждения аккаунта перейдите на почту!'),
                  actions: <Widget>[
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 40),
                TitledTextField(
                  hintText: 'Почта',
                  subTitle: 'Email',
                  contoller: emailTextController,
                ),
                SizedBox(height: 40),
                TitledTextField(
                  hintText: 'Имя',
                  subTitle: 'Name',
                  contoller: nameTextController,
                ),
                SizedBox(height: 40),
                TitledTextField(
                  hintText: 'Телефон',
                  subTitle: 'phone',
                  contoller: phoneTextController,
                ),
                SizedBox(height: 16),
                TitledTextField(
                  hintText: 'Пароль',
                  subTitle: 'Пароль',
                  canBeObscured: true,
                  contoller: pwdTextController,
                ),
                SizedBox(height: 16),
                TitledTextField(
                  hintText: 'Повторите пароль',
                  subTitle: 'Пароль',
                  canBeObscured: true,
                  contoller: repeatPwdTextController,
                ),
                SizedBox(height: 48),
                FAB(
                  text: 'Создать аккаунт',
                  textColor: CustomColors.white,
                  backgroundColor: CustomColors.green,
                  buttonType: ButtonType.filled,
                  buttonSize: ButtonSize.block,
                  onTap: () {
                    final email = emailTextController.value.text;
                    final name = nameTextController.value.text;
                    final phone = phoneTextController.value.text;
                    final pwd = pwdTextController.value.text;
                    final repeatedPwd = repeatPwdTextController.value.text;

                    final params = ParamsUserDataModel(
                        email: email,
                        name: name,
                        phone: phone,
                        password: pwd,
                        passwordConfirmation: repeatedPwd);

                    context.read<RegisterBloc>().add(
                          RegisterAttempted(params),
                        );
                  },
                ),
                if (state is RegisterInProgress)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
