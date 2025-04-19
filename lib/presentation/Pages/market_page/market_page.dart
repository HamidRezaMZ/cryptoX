import 'package:cryptox/data/Models/crypto_model/CryptoData.dart';

import 'package:cryptox/domain/Providers/crypto_api_provider.dart';
import 'package:cryptox/domain/Providers/theme_provider.dart';

import 'package:cryptox/presentation/Pages/market_page/helpers/all_market_container.dart';
import 'package:cryptox/presentation/Pages/market_page/helpers/all_market_shimmer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../data/Models/crypto_model/response_model.dart';

class MarketPage extends StatelessWidget {
   MarketPage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.07,
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode ? Colors.black : Colors.white,
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(108, 59, 170, 1)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              padding: const EdgeInsets.only(
                  right: 15, left: 15, top: 10, bottom: 10),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: TextField(
                    controller: searchController,
                    autocorrect: true,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Search Something',

                      hintStyle: theme.textTheme.labelLarge!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w300),
                    ),

                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width,
              height: height,
              child: Consumer<CryptoApiProvider>(
                builder: (context, cryptoProvider, child) {
                  switch (cryptoProvider.state.status) {
                    case Status.COMPLETED:
                      List<CryptoData>? model = cryptoProvider
                          .allCryptoDataFuture.data!.cryptoCurrencyList;
                      return AllMarketContainer(model: model);
                    case Status.LOADING:
                      return const AllMarketShimmer();
                    case Status.ERROR:
                      return const Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("Something Wrong...."),
                            Icon(Icons.refresh),
                          ],
                        ),
                      );
                    default:
                      return Text(cryptoProvider.state.message);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
