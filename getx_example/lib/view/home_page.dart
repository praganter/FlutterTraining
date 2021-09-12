import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/count_controller.dart';

class Home extends StatelessWidget {
  final controller = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar title"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${controller.count}",
                style: TextStyle(fontSize: 45),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/second");
              },
              child: Text("Next page"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
