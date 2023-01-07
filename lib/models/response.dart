import 'dart:convert';

import 'package:coinrich/models/coin_data.dart';

class CoinResponse {
  CoinData data;
  CoinResponse({
    required this.data,
  });

  CoinResponse copyWith({
    CoinData? data,
  }) {
    return CoinResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data.toMap()});

    return result;
  }

  factory CoinResponse.fromMap(Map<String, dynamic> map) {
    Iterable<String> keys = map['data'].keys;
    String key = keys.first;
    key = key.replaceAll('(', '').replaceAll(')', '');
    print('key is $key');

    return CoinResponse(
      data: CoinData.fromMap(map['data'][key]),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinResponse.fromJson(String source) =>
      CoinResponse.fromMap(json.decode(source));

  @override
  String toString() => 'CoinResponse(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinResponse && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
