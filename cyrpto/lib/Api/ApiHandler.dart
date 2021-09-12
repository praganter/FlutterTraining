import 'package:http/http.dart' as http;
import '/Modal/CurrencyModal';

class ApiHandler {
  final String _apiKey = "482fd92bd5b1e50b624800905408f900fb95eabe";
  final String _apiBaseUrl = "https://api.nomics.com/v1/market-cap/history";

  Future getCurrencies() async {
    var body;
    final _url = _apiBaseUrl +
        "?key=$_apiKey&start=2018-04-14T00%3A00%3A00Z&end=2018-05-14T00%3A00%3A00Z";

    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      var json = response.body;
      return currencyModalFromJson(json);
    } else {
      print("Aga data yok");
    }

    return body.map((item) => CurrencyModal.fromJson(item)).toList();
  }
}
