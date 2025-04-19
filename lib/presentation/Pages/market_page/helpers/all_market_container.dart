
import 'package:cryptox/presentation/Helpers/decimal_rounder.dart';
import 'package:cryptox/presentation/Pages/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AllMarketContainer extends StatelessWidget {
  final dynamic model;

  const AllMarketContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return ListView.builder(
        itemBuilder: (context, index) {
          var number = index + 1;
          var tokenId = model[index].id;
          var data = model[index];
          MaterialColor filterColor = DecimalRounder.setColorFilter(
              model[index].quotes![0].percentChange24h);

          var finalPrice = DecimalRounder.removePriceDecimals(
              model[index].quotes![0].price);

          var percentChange = DecimalRounder.removePercentDecimals(
              model[index].quotes![0].percentChange24h);


          Icon percentIcon = DecimalRounder.setPercentChangesIcon(
              model[index].quotes![0].percentChange24h);

          int endIndex = model[index].name.length < 10
              ? model[index].name.length
              : 10;


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
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: ClipOval(
                        child: Image.network(
                      "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png",
                      width: 32,
                      height: 32,
                    )),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model[index].symbol!,
                          style:
                              theme.textTheme.labelLarge!.copyWith(fontSize: 15),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${model[index].name!}".substring(0,endIndex),
                                style: theme.textTheme.labelLarge!.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(filterColor, BlendMode.srcATop),
                        child: SvgPicture.network(
                            "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenId.svg")),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$$finalPrice",
                            style: theme.textTheme.labelLarge!
                                .copyWith(fontSize: 15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              percentIcon,
                              Text(
                                "$percentChange%",
                                style: theme.textTheme.labelSmall!
                                    .copyWith(fontSize: 12),
                              ),
                            ],
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
        itemCount: model!.length);
  }
}
