import 'package:cyrpto/Controller/product_controller.dart';
import 'package:cyrpto/View/currency_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(CurrencyController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [GetPage(name: '/currencyPage', page: () => CurrencyPage())],
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('currencyPage');
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
    );
  }
}
