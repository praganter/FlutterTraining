import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/crypto_controller.dart';
import 'Views/home_page.dart';
import 'Views/last_page.dart';
import 'Views/list_page.dart';

void main() {
  Get.put(CryptoController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/list', page: () => ListPage()),
        GetPage(name: '/last', page: () => LastPage()),
      ],
      darkTheme: ThemeData.dark(),
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
