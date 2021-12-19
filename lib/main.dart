import 'package:bavito/ui/home_page/home_page.dart';
import 'package:bavito/utils/size_util.dart';
import 'package:flutter/material.dart';

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
      home: HomePage(),
    );
  }
}
