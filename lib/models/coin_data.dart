import 'dart:convert';

class CoinData {
  String percentChange24Hours;
  String cmcRank;
  String price;
  String symbol;
  String name;
  CoinData({
    required this.percentChange24Hours,
    required this.cmcRank,
    required this.price,
    required this.symbol,
    required this.name,
  });

  CoinData copyWith({
    String? percentChange24Hours,
    String? cmcRank,
    String? price,
    String? symbol,
    String? name,
  }) {
    return CoinData(
      percentChange24Hours: percentChange24Hours ?? this.percentChange24Hours,
      cmcRank: cmcRank ?? this.cmcRank,
      price: price ?? this.price,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'percentChange24Hours': percentChange24Hours});
    result.addAll({'cmcRank': cmcRank});
    result.addAll({'price': price});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});

    return result;
  }

  factory CoinData.fromMap(Map<String, dynamic> map) {
    return CoinData(
      percentChange24Hours:
          map['quote']['USD']['percent_change_24h'].toString(),
      cmcRank: map['cmc_rank'].toString(),
      price: map['quote']['USD']['price'].toString(),
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinData.fromJson(String source) {
    return CoinData.fromMap(json.decode(source));
  }

  @override
  String toString() {
    return 'CoinData(percentChange24Hours: $percentChange24Hours, cmcRank: $cmcRank, price: $price, symbol: $symbol, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinData &&
        other.percentChange24Hours == percentChange24Hours &&
        other.cmcRank == cmcRank &&
        other.price == price &&
        other.symbol == symbol &&
        other.name == name;
  }

  @override
  int get hashCode {
    return percentChange24Hours.hashCode ^
        cmcRank.hashCode ^
        price.hashCode ^
        symbol.hashCode ^
        name.hashCode;
  }
}
