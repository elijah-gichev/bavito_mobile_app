import 'package:bavito/services/user_service.dart';
import 'package:bavito/ui/splash/splash_page.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bavito',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        ResponsiveSize.init(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        );
        return child!;
      },
      home: const SplashPage(),
    );
  }
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  getIt = GetIt.instance;

  getIt.registerSingleton<UserService>(
    UserService(),
  );
}

late GetIt getIt;
