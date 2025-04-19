import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatelessWidget {
   const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.114;
    int length = 4;

    var themeProvider = Provider.of<ThemeProvider>(context);

    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);


    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Wallet",
                    style: theme.textTheme.labelLarge!.copyWith(fontSize: 25),
                  ),
                  const Text(
                    "X",
                    style: TextStyle(color: Color.fromRGBO(108,59,170,1),fontSize: 30,fontWeight: FontWeight.bold),
                  ),

                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                      colors: [Colors.black, Color.fromRGBO(108,59,170,1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.repeated),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Credit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            FontAwesomeIcons.ccVisa,
                            color: Colors.white,
                            size: 40,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "HamidReza MahmoudZadeh",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "****** 4565",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("09/26",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Current Balance",
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "\$246,005.05",
                    style: theme.textTheme.labelLarge!.copyWith(fontSize: 40),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(33, 197, 6, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        "Deposit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 44, 44, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        "Withdraw",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction",
                    style: theme.textTheme.labelLarge!.copyWith(fontSize: 20),
                  ),
                  Text(
                    "Last 4 days",
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: height * length,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var number = index + 1;
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: themeProvider.isDarkMode
                              ? Colors.black
                              : const Color.fromRGBO(248, 245, 245, 1.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: height * 0.075,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                number.toString(),
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "BTC",
                                    style: theme.textTheme.labelLarge!
                                        .copyWith(fontSize: 18),
                                  ),
                                  Text(
                                    "BitCoin",
                                    style: theme.textTheme.labelSmall!.copyWith(
                                        fontSize: 15,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                             Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("\$12,000.0",style: theme.textTheme.labelLarge!.copyWith(fontSize: 18),),
                                    const Text(
                                      "Send",
                                      style: TextStyle(color: Colors.green,fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
