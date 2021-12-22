// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/widgets/big_text_field.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

void showNewExchangeComment(
  BuildContext context, {
  required VoidCallback onSubmitPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext newContext) {
      return const NewExchangeCommentBox();
    },
  );
}

class NewExchangeCommentBox extends StatelessWidget {
  const NewExchangeCommentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => LogoutCubit(
    //     Auth(getIt<ApiClientService>().apiClient),
    //     getIt<LocalStorageService>(),
    //     getIt<ApiClientService>(),
    //     getIt<UserService>(),
    //   ),
    //   child: LogoutDialogBoxView(),
    // );
    return const LogoutDialogBoxView();
  }
}

class LogoutDialogBoxView extends StatefulWidget {
  const LogoutDialogBoxView({Key? key}) : super(key: key);

  @override
  State<LogoutDialogBoxView> createState() => _LogoutDialogBoxViewState();
}

class _LogoutDialogBoxViewState extends State<LogoutDialogBoxView> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Добавьте комментарий к обмену",
              style: TextStyle(
                fontSize: 22.h,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            BigTextField(
              textEditingController: textEditingController,
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.green,
                borderRadius: BorderRadius.circular(48.0.h),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () async {
                    //await context.read<LogoutCubit>().logout();

                    //Navigator.pop(context);
                  },
                  child: Text(
                    "Сделать обмен",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.h,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.0.h),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Отменить",
                    style: TextStyle(
                      color: CustomColors.green,
                      fontSize: 16.h,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ),
            // if (state is LogoutInProgress)
            //   Center(
            //     child: CircularProgressIndicator(),
            //   ),
          ],
        ),
      ),
    );
  }
}
