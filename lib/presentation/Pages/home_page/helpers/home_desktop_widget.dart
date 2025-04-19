import 'package:cryptox/data/Models/crypto_model/CryptoData.dart';
import 'package:cryptox/domain/Providers/crypto_api_provider.dart';
import 'package:cryptox/domain/Providers/theme_provider.dart';

import 'package:cryptox/presentation/Pages/home_page/component/customized_container.dart';
import 'package:cryptox/presentation/Pages/home_page/component/shimmer_top_movers_card.dart';
import 'package:cryptox/presentation/Pages/home_page/component/top_movers_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../../../../data/Models/crypto_model/response_model.dart';

class HomeDesktopWidget extends StatelessWidget {
  const HomeDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(children: [
                    Text(
                      "Crypt",
                      style: theme.textTheme.labelLarge!.copyWith(fontSize: 25),
                    ),
                    const Text(
                      "X",
                      style: TextStyle(
                          color: Color.fromRGBO(108, 59, 170, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "Crypto Currencies",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "Inter"),
                            )),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "Exchanges",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "Inter"),
                            )),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "DexScan",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "Inter"),
                            )),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "Community",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "Inter"),
                            )),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "Products",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "Inter"),
                            )),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Text(
                                "Portfolio",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    fontFamily: "Inter"),
                              )),
                          SizedBox(
                            width: width * 0.015,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Text(
                                "WatchList",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    fontFamily: "Inter"),
                              )),
                          SizedBox(
                            width: width * 0.015,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 20,left: 10),
                                width: width * 0.18,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(239, 242, 245, 1),
                                    borderRadius: BorderRadius.circular(8)),
                                height: height * 0.05,
                                child: Row(
                                  children: [
                                    SvgPicture.asset("Assets/svg/search.svg",width: 17,height: 17,color: Colors.grey,),
                                    const SizedBox(width: 10,),
                                    const Text("Search",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 13),)
                                  ],
                                ),
                              ),
                               SizedBox(
                                width: width * 0.005,
                              ),
                              Container(
                                height: height * 0.05,
                                width: width * 0.05,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text("Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                               SizedBox(
                                width: width * 0.005,
                              ),
                              Container(
                                height: height * 0.05,
                                width: width * 0.03,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5)),
                                child: InkWell(onHover:(value) {

                                },child: Center(child: SvgPicture.asset("Assets/svg/menu.svg",height: 20,width: 20,))),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
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
