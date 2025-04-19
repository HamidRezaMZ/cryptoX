import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:cryptox/presentation/Helpers/decimal_rounder.dart';
import 'package:cryptox/presentation/Pages/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopMoversCard extends StatelessWidget {
  final dynamic model;

  const TopMoversCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var theme = Theme.of(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        var data = model[index];
        var tokenId = data.id;



        var finalPrice =
            DecimalRounder.removePriceDecimals(model[index].quotes![0].price);
        var percentChange = DecimalRounder.removePercentDecimals(
            model[index].quotes![0].percentChange24h);


        Icon percentIcon = DecimalRounder.setPercentChangesIcon(
            model[index].quotes![0].percentChange24h);

        return InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          radius: 15,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(data: data),
                ));
          },
          child: Container(
            height: height * 0.2,
            width: width * 0.4,
            decoration: BoxDecoration(
                color: themeProvider.isDarkMode ? Colors.black : Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: themeProvider.isDarkMode
                          ? Colors.transparent
                          : Colors.grey.shade300,
                      blurRadius: 1,
                      offset: const Offset(3, 3))
                ],
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            margin: const EdgeInsets.only(right: 10,left: 5,bottom: 5,top: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(left: 10, top: 20),
                      child: ClipOval(
                          child: Image.network(
                        'https://s2.coinmarketcap.com/static/img/coins/64x64/$tokenId.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10, top: 30),
                      child: Row(
                        children: [
                          percentIcon,
                          Text(
                            "$percentChange".substring(0, 5) + "%",
                            style: theme.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Text(data.symbol.toString(),
                        style:
                            theme.textTheme.labelLarge!.copyWith(fontSize: 20)),
                    Text(finalPrice.toString(),
                        style:
                            theme.textTheme.bodyLarge!.copyWith(fontSize: 15)),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
