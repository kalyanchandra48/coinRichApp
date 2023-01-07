import 'package:coinrich/models/response.dart';
import 'package:coinrich/pages/home_page/home_page_viewmodel.dart';
import 'package:coinrich/styles/colors.dart';
import 'package:coinrich/styles/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomWidget extends StatelessWidget {
  int index;
  CustomWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
        builder: (context, homePageViewModel, _) {
      CoinResponse coinresponse = homePageViewModel.coinData[index];

      if (homePageViewModel.coinData.isEmpty) {
        return const CupertinoActivityIndicator();
      }

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: MediaQuery.of(context).size.height / 7,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: AppColors.appBarColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FirstRowofItem(coinData: coinresponse),
            SecondRowofItem(
              coinData: coinresponse,
            )
          ],
        ),
      );
    });
  }
}

class SecondRowofItem extends StatelessWidget {
  SecondRowofItem({
    super.key,
    required this.coinData,
  });
  CoinResponse coinData;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Price',
            style: AppFonts.normalText,
          ),
          Text(
            '\$ ${coinData.data.price.substring(0, 7)}',
            style: AppFonts.normalText,
          ),
          Text(coinData.data.price),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text(
                  'Rank',
                  style: AppFonts.normalText,
                ),
                Text(
                  coinData.data.cmcRank,
                  style: AppFonts.normalText,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 26,
            width: 20,
            decoration: BoxDecoration(
                color: AppColors.pieColor, shape: BoxShape.circle),
            child: const Center(
                child: Icon(
              Icons.arrow_forward,
              size: 20,
            )),
          )
        ],
      ),
    );
  }
}

class FirstRowofItem extends StatelessWidget {
  CoinResponse coinData;
  FirstRowofItem({
    super.key,
    required this.coinData,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          coinData.data.name,
          style: AppFonts.smalltitle,
        ),
        const SizedBox(
          width: 20,
        ),
        Icon(
          Icons.arrow_upward,
          color: AppColors.arrowColor,
        ),
        Text(
          '${coinData.data.percentChange24Hours.substring(0, 4)}%',
          style: AppFonts.normalText,
        ),
        const Spacer(),
        Container(
          height: 20,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            color: AppColors.symbolColor,
          ),
          child: Center(
              child: Text(
            coinData.data.symbol,
            style: AppFonts.normalText,
          )),
        ),
      ],
    );
  }
}
