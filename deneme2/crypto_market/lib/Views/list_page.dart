import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:crypto_market/Controllers/crypto_controller.dart';
import 'package:crypto_market/Modals/crypto_modal.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CryptoController controller = Get.find();
    print(controller.currencyList);
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: Text("Listing Page"),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.currencyList.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                        child: CustomLine(
                            index: index, list: controller.currencyList),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/');
              },
              child: Icon(Icons.keyboard_return),
            ),
          ],
        ),
      ),
    );
  }
}

//! Custom List Tile for evey row of ListView

class CustomLine extends StatelessWidget {
  final int index;
  final List<CurrencyModal> list;
  const CustomLine({
    Key? key,
    required this.index,
    required this.list,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  list[index].logoUrl.endsWith("svg")
                      ? CircleAvatar(
                          radius: 30,
                          child: ClipOval(
                            child: SvgPicture.network(
                              list[index].logoUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 30,
                          child: ClipOval(
                            child: Image.network(
                              list[index].logoUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                ],
              ),
            ),
            VerticalDivider(),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list[index].symbol,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(list[index].rank + ". " + list[index].name),
                ],
              ),
            ),
            //VerticalDivider(),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(list[index].price),
                  Text("\$${list[index].marketCap}"),
                ],
              ),
            ),
            VerticalDivider(),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    list[index].the1D.priceChangePct.contains("-")
                        ? "${list[index].the1D.priceChangePct} ↓"
                        : "${list[index].the1D.priceChangePct} ↑",
                    style: TextStyle(
                      color: list[index].the1D.priceChangePct.contains("-")
                          ? Colors.red
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("\$${list[index].the1D.volume}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
