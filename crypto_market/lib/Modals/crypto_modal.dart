// To parse this JSON data, do
//
//     final currencyModal = currencyModalFromJson(jsonString);

import 'dart:convert';

List<CurrencyModal> currencyModalFromJson(String str) =>
    List<CurrencyModal>.from(
        json.decode(str).map((x) => CurrencyModal.fromJson(x)));

String currencyModalToJson(List<CurrencyModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrencyModal {
  CurrencyModal({
    required this.id,
    required this.symbol,
    required this.name,
    required this.logoUrl,
    required this.price,
    required this.marketCap,
    required this.rank,
    required this.the1D,
    required this.the7D,
    required this.the30D,
  });

  late String id;
  late String symbol;
  late String name;
  late String logoUrl;
  late String price;
  late String marketCap;
  late String rank;
  late The1D the1D;
  late The1D the7D;
  late The1D the30D;

  factory CurrencyModal.fromJson(Map<String, dynamic> json) => CurrencyModal(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        logoUrl: json["logo_url"],
        price: json["price"],
        marketCap: json["market_cap"],
        rank: json["rank"],
        the1D: The1D.fromJson(json["1d"]),
        the7D: The1D.fromJson(json["7d"]),
        the30D: The1D.fromJson(json["30d"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "logo_url": logoUrl,
        "price": price,
        "market_cap": marketCap,
        "rank": rank,
        "1d": the1D.toJson(),
        "7d": the7D.toJson(),
        "30d": the30D.toJson(),
      };
}

class The1D {
  The1D({
    required this.volume,
    required this.priceChange,
    required this.priceChangePct,
    required this.volumeChange,
    required this.volumeChangePct,
    required this.marketCapChange,
    required this.marketCapChangePct,
  });

  late String volume;
  late String priceChange;
  late String priceChangePct;
  late String volumeChange;
  late String volumeChangePct;
  late String marketCapChange;
  late String marketCapChangePct;

  factory The1D.fromJson(Map<String, dynamic> json) => The1D(
        volume: json["volume"],
        priceChange: json["price_change"],
        priceChangePct: json["price_change_pct"],
        volumeChange: json["volume_change"],
        volumeChangePct: json["volume_change_pct"],
        marketCapChange: json["market_cap_change"],
        marketCapChangePct: json["market_cap_change_pct"],
      );

  Map<String, dynamic> toJson() => {
        "volume": volume,
        "price_change": priceChange,
        "price_change_pct": priceChangePct,
        "volume_change": volumeChange,
        "volume_change_pct": volumeChangePct,
        "market_cap_change": marketCapChange,
        "market_cap_change_pct": marketCapChangePct,
      };
}
