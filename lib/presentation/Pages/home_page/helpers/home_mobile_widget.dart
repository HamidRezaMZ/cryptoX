import 'package:cryptox/data/Models/crypto_model/CryptoData.dart';
import 'package:cryptox/domain/Providers/crypto_api_provider.dart';
import 'package:cryptox/domain/Providers/theme_provider.dart';

import 'package:cryptox/presentation/Pages/home_page/component/customized_container.dart';
import 'package:cryptox/presentation/Pages/home_page/component/shimmer_top_movers_card.dart';
import 'package:cryptox/presentation/Pages/home_page/component/top_movers_card.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../data/Models/crypto_model/response_model.dart';



class HomeMobileWidget extends StatelessWidget {
  const HomeMobileWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Scaffold(
      key: _key,
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomizedContainer(
                      onTab: () => _key.currentState!.openDrawer(),
                      svgAddress: 'Assets/svg/menu.svg'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Crypt",
                        style:
                        theme.textTheme.labelLarge!.copyWith(fontSize: 25),
                      ),
                      const Text(
                        "X",
                        style: TextStyle(
                            color: Color.fromRGBO(108, 59, 170, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CustomizedContainer(
                    onTab: () {
                      themeProvider.toggleTheme();

                    },
                    svgAddress: themeProvider.isDarkMode
                        ? 'Assets/svg/sun.svg'
                        : 'Assets/svg/moon.svg',
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text("Hello HamidReza",
                  style: theme.textTheme.labelLarge!.copyWith(fontSize: 25)),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                      colors: [Colors.black, Color.fromRGBO(108, 59, 170, 1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.repeated),
                ),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Current Balance",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "\$256,002.5",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "+17.45%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text("Top Movers",
                      style:
                      theme.textTheme.labelLarge!.copyWith(fontSize: 15)),
                  const Icon(Icons.arrow_right_sharp)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: height * 0.25,
                child: Consumer<CryptoApiProvider>(
                  builder: (context, cryptoProvider, child) {
                    switch (cryptoProvider.state.status) {
                      case Status.COMPLETED:
                        List<CryptoData>? model = cryptoProvider
                            .topGainerDataFuture.data!.cryptoCurrencyList;
                        return TopMoversCard(
                          model: model,
                        );
                      case Status.LOADING:
                        return const ShimmerTopMoversCard();
                      case Status.ERROR:
                        return Align(

                          alignment: Alignment.center,

                          child: InkWell(
                            onTap: () {
                              cryptoProvider.reBuildUiTryAgain();
                            },
                            child: const Center(
                                child: Column(
                                  children: [
                                    Text("Something Wrong...."),
                                    Icon(Icons.refresh),
                                  ],
                                )),
                          ),
                        );
                      default:
                        return Text(cryptoProvider.state.message);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text("Top Losers",
                      style:
                      theme.textTheme.labelLarge!.copyWith(fontSize: 15)),
                  const Icon(Icons.arrow_right_sharp)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: height * 0.25,
                child: Consumer<CryptoApiProvider>(
                  builder: (context, cryptoProvider, child) {
                    switch (cryptoProvider.state.status) {
                      case Status.COMPLETED:
                        List<CryptoData>? model = cryptoProvider
                            .topLooserDataFuture.data!.cryptoCurrencyList;
                        return TopMoversCard(
                          model: model,
                        );
                      case Status.LOADING:
                        return const ShimmerTopMoversCard();
                      case Status.ERROR:
                        return InkWell(
                          onTap: () {
                            cryptoProvider.reBuildUiTryAgain();
                          },
                          child: const Center(
                              child: Column(
                                children: [
                                  Text("Something Wrong...."),
                                  Icon(Icons.refresh),
                                ],
                              )),
                        );
                      default:
                        return Text(cryptoProvider.state.message);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text("News",
                      style:
                      theme.textTheme.labelLarge!.copyWith(fontSize: 15)),
                  const Icon(Icons.arrow_right_sharp)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
