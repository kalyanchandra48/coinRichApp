import 'package:coinrich/models/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageViewModel extends ChangeNotifier {
  static HomePageViewModel of(BuildContext context) =>
      context.read<HomePageViewModel>();

  List<CoinResponse> _coinData = [];

  List<CoinResponse> get coinData => _coinData;

  void updateCoinData(List<CoinResponse> coinData) {
    _coinData = coinData;
    notifyListeners();
  }
}
