import 'package:coinrich/common_widgets/item_widget.dart';
import 'package:coinrich/models/response.dart';
import 'package:coinrich/pages/home_page/home_page_viewmodel.dart';
import 'package:coinrich/services/cryto_service.dart';
import 'package:coinrich/styles/colors.dart';
import 'package:coinrich/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageViewModel(),
      builder: (context, child) => const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    updateCoinData();
  }

  Future<void> updateCoinData() async {
    CryptoService cryptoService = CryptoService();
    List<CoinResponse> coinData = await cryptoService.getCoinDataDetails();

    HomePageViewModel coinDataProvider =
        Provider.of<HomePageViewModel>(context, listen: false);
    coinDataProvider.updateCoinData(coinData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarColor,
        title: Text(
          'CoinRich',
          style: AppFonts.appBarHeader,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 100),
          children: [
            const HeaderWidget(),
            ListView.separated(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              shrinkWrap: true,
              itemCount: 6,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return CustomWidget(index: index);
              },
            )
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.pie_chart_outline_rounded,
          color: AppColors.pieColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Show Chart',
          style: AppFonts.smalltitle,
        ),
        const Spacer(),
        Text('Count: 6',
            style: AppFonts.smalltitle.copyWith(
              color: AppColors.countColor,
            ))
      ],
    );
  }
}
