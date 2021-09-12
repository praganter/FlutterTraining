import 'package:cyrpto/API/ApiHandler.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '/Modal/CurrencyModal';

class CurrencyController extends GetxController {
  List<CurrencyModal> currencyList =
      List<CurrencyModal>.empty(growable: true).obs;

  @override
  void onInit() {
    getcurrency();
    super.onInit();
  }

  Future<void> getcurrency() async {
    try {
      var data = await ApiHandler().getCurrencies();
      if (data.isNotEmpty && data != null) {
        return currencyList.assignAll(data);
      }
    } catch (e) {}
  }
}
