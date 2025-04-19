import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final dynamic data;

  const DetailPage({super.key,  this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${widget.data.symbol.toString().toUpperCase()} / USD",
          style: theme.textTheme.labelLarge!.copyWith(fontSize: 20),
        ),
        leadingWidth: width * 0.09,
        elevation: 0,
        forceMaterialTransparency: true,
        leading: Container(
          width: width * 0.05,
          height: height * 0.05,
          padding: const EdgeInsets.only(left: 15),
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              "Assets/svg/arrow.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {},
              child: SvgPicture.asset(
                "Assets/svg/bookmark.svg",
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 15,  bottom: 15),
            child: Column(
              children: [

                Container(
                  padding: const EdgeInsets.all(25),
                  width: width,
                  height: height * 0.6,
                  decoration: BoxDecoration(
                    color:
                        themeProvider.isDarkMode ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipOval(
                                child: Image.network(
                              'https://s2.coinmarketcap.com/static/img/coins/64x64/${widget.data.id}.png',
                              fit: BoxFit.cover,
                            )),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.data.name}/${widget.data.symbol}",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              Text("\$${widget.data.quotes![0].price}",
                                  style: theme.textTheme.labelLarge!
                                      .copyWith(fontSize: 20)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("Assets/svg/chart_2.svg"),
                          SvgPicture.asset("Assets/svg/zoom_in.svg"),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      themeProvider.isDarkMode
                          ? SvgPicture.asset(
                              "Assets/svg/Tab_2.svg",
                              width: width * 0.9,
                            )
                          : SvgPicture.asset(
                              "Assets/svg/Tab.svg",
                              width: width * 0.9,
                            ),
                      Expanded(
                          child: themeProvider.isDarkMode
                              ? SvgPicture.asset(
                                  "Assets/svg/chart_dark_mode.svg")
                              : SvgPicture.asset(
                                  "Assets/svg/chart_light_mode.svg"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Statistics",
                      style: theme.textTheme.labelLarge!.copyWith(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color:
                        themeProvider.isDarkMode ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      bottomSheet: Container(
        width: width,
        height: height * 0.1,
        decoration: BoxDecoration(
            color: themeProvider.isDarkMode ? Colors.black : Colors.white,
            boxShadow: themeProvider.isDarkMode
                ? null
                : [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 0.5,
                        offset: const Offset(-2, -2))
                  ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              width: width * 0.45,
              height: height * 0.06,
              decoration: BoxDecoration(
                  color: themeProvider.isDarkMode ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.deepPurple, width: 2)),
              child: const Center(
                child: Text(
                  "Sell",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              width: width * 0.45,
              height: height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: Text(
                  "Buy",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
