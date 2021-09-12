import 'package:crypto_market/Modals/crypto_modal.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String _apiBaseUrl = "https://api.nomics.com/v1/currencies/ticker?";
  final String _apiKey = "key=482fd92bd5b1e50b624800905408f900fb95eabe";
  var apiTag = '&status=active&interval=1d,7d,30d&per-page=75&page=1';

  Future<List<CurrencyModal>> getCurrencies() async {
    var body;
    final _url = _apiBaseUrl + _apiKey + apiTag;
    print(_url);
    var response = await http.get(Uri.parse(_url));
    //print(response.body);
    if (response.statusCode == 200) {
      //print("Apihandler data dönüyor");
      var json = response.body;
      return currencyModalFromJson(json);
    } else {
      print("Ağam data yok");
    }
    return body.map((item) => CurrencyModal.fromJson(item)).toList();
  }
}
