import 'package:cyrpto/Controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyPage extends StatelessWidget {
  final CurrencyController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Currency Tracker App BY Dr.Swift"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //() => Text(controller.currencyList[0].marketCap),
            Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: controller.currencyList.length,
                    itemBuilder: (_, index) => Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child:
                                Text(controller.currencyList[index].marketCap),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Icon(Icons.keyboard_return),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.dark_mode),
        onPressed: () {
          if (Get.isDarkMode) {
            Get.changeThemeMode(ThemeMode.light);
          } else {
            Get.changeThemeMode(ThemeMode.dark);
          }
        },
      ),
    );
  }
}
