import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/home_page.dart';
import 'view/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: Home(),
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/second', page: () => SecondPage()),
      ],
    );
  }
}
