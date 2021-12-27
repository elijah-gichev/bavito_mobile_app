import 'package:bavito/resources/colors.dart';
import 'package:bavito/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      navigateToMainPage(context);
    });

    super.initState();
  }

  void navigateToMainPage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
            ),
            const Spacer(flex: 1),
            const Text(
              'Приложение для обмена товарами(не авито)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomColors.green,
                fontSize: 20,
                fontFamily: 'Roboto',
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
