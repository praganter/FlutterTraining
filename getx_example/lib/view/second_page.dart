import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/count_controller.dart';

class SecondPage extends StatelessWidget {
  final CountController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Conter hala burada ${controller.count}"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/");
              },
              child: Icon(Icons.ac_unit),
            )
          ],
        ),
      ),
    );
  }
}
