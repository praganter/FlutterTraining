import 'package:crypto_market/ApiHandler/api_handler.dart';
import 'package:crypto_market/Modals/crypto_modal.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CryptoController extends GetxController {
  List<CurrencyModal> currencyList = List<CurrencyModal>.empty(growable: true).obs;

  final RxBool oneDay = false.obs;
  final RxBool sevenDay = false.obs;
  final RxBool thirtyDay = false.obs;

  @override
  void onInit() {
    getcurrency();
    super.onInit();
  }

  Future<void> getcurrency() async {
    try {
      var data = await ApiHandler().getCurrencies();
      currencyList.assignAll(data);
      currencyList = marketCapFormatter(currencyList);
      currencyList = priceFormatter(currencyList);
      currencyList = percentageFormatter(currencyList);
      currencyList = volumeFormatter(currencyList);
    } catch (e) {
      print(e.toString());
    }
  }

//? Changes price value with 3 decimals and without comma.
  List<CurrencyModal> priceFormatter(List<CurrencyModal> rawList) {
    List<CurrencyModal> expectedList = rawList;
    for (var i = 0; i < expectedList.length; i++) {
      var temp = NumberFormat.simpleCurrency(locale: 'chr', decimalDigits: 3).format(double.parse(expectedList[i].price));
      temp = temp.replaceAll(",", " ");
      expectedList[i].price = temp;
    }
    return expectedList;
  }

  //! Changes market value from 123.124.512,12 => 123 M
  List<CurrencyModal> marketCapFormatter(List<CurrencyModal> rawList) {
    List<CurrencyModal> expectedList = rawList;
    for (var i = 0; i < expectedList.length; i++) {
      var temp = expectedList[i].marketCap;
      if (6 >= temp.length) {
        expectedList[i].marketCap = temp.substring(0, 3) + "M";
      } else {
        expectedList[i].marketCap = temp.substring(0, (temp.length - 9)) + "B";
      }
    }
    return expectedList;
  }

  List<CurrencyModal> percentageFormatter(List<CurrencyModal> rawList) {
    var expectedList = rawList;
    for (var i = 0; i < expectedList.length; i++) {
      var temp = double.parse(expectedList[i].the1D.priceChangePct);
      temp = temp * 100;
      expectedList[i].the1D.priceChangePct = temp.toStringAsFixed(2);
    }
    return expectedList;
  }

  List<CurrencyModal> volumeFormatter(List<CurrencyModal> rawList) {
    var expectedList = rawList;
    for (var i = 0; i < expectedList.length; i++) {
      var temp = expectedList[i].the1D.volume;
      if (12 >= temp.length) {
        expectedList[i].the1D.volume = temp.substring(0, (temp.length - 9)) + "M vol";
      } else {
        expectedList[i].the1D.volume = temp.substring(0, (temp.length - 12)) + "B vol";
      }
    }
    return expectedList;
  }
}
