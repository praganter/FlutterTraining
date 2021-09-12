import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              },
              child: Icon(Icons.dark_mode),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/list');
              },
              child: Icon(Icons.arrow_forward),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Dr.Flutter",
                  "Hello Xinerji",
                  icon: Icon(Icons.computer),
                  snackPosition: SnackPosition.TOP,
                );
              },
              child: RotatedBox(
                quarterTurns: 2,
                child: Tooltip(
                  message: "GetX SnackBar",
                  child: Icon(
                    Icons.call_to_action,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Tooltip(message: "TR <-> EN", child: Icon(Icons.language)),
            ),
          ],
        ),
      ),
    );
  }
}
