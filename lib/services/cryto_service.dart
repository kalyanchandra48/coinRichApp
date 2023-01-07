import 'package:coinrich/models/response.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  List<CoinResponse> coinresponses = [];
  List<CoinResponse> get coinDatas => coinresponses;
  List<String> values = ['BTC', 'ETH', 'LTC', 'ADA', 'ATOM', 'BCH', 'BNB'];

  Future<List<CoinResponse>> getCoinDataDetails() async {
    for (String value in values) {
      http.Response response = await http.get(
          Uri.parse(
              'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=$value'),
          headers: {
            'X-CMC_PRO_API_KEY': '27ab17d1-215f-49e5-9ca4-afd48810c149'
          });

      CoinResponse coinResponse = CoinResponse.fromJson(response.body);

      coinresponses.add(coinResponse);
    }

    return coinresponses;
  }
}
