import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:cryptox/presentation/Helpers/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SendFeedbackPage extends StatelessWidget {
  const SendFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Send Feedback",
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
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15,bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Feedback",
                        style:
                            theme.textTheme.labelLarge!.copyWith(fontSize: 30)),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Text("How Would You Rate Your Experience?",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.normal))
                  ],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                SizedBox(
                  width: width,
                  height: height * 0.05,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,),
                      Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,),
                      Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,),
                      Icon(FontAwesomeIcons.star),
                      Icon(FontAwesomeIcons.star),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Column(
                  children: [
                    Text("Would you tell us a little more about you experiences?",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 1,
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text("Security And Privacy",
                              style: theme.textTheme.labelLarge!.copyWith(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Row(
                            children: [
                              SvgPicture.asset("Assets/svg/thumb_up.svg",color: themeProvider.isDarkMode ? Colors.white : Colors.black,),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              SvgPicture.asset("Assets/svg/thumb_down.svg",color: themeProvider.isDarkMode ? Colors.white : Colors.black,),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 1,
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text("Speed And Update",
                              style: theme.textTheme.labelLarge!.copyWith(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Row(
                            children: [
                              SvgPicture.asset("Assets/svg/thumb_up.svg",color: themeProvider.isDarkMode ? Colors.white : Colors.black,),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              SvgPicture.asset("Assets/svg/thumb_down.svg",color: themeProvider.isDarkMode ? Colors.white : Colors.black,),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 1,
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text("App Quality",
                              style: theme.textTheme.labelLarge!.copyWith(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Row(
                            children: [
                              SvgPicture.asset("Assets/svg/thumb_up.svg",color: themeProvider.isDarkMode ? Colors.white : Colors.black,),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              SvgPicture.asset("Assets/svg/thumb_down.svg",color: themeProvider.isDarkMode ? Colors.white : Colors.black,),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text("Comment",
                        style:
                            theme.textTheme.labelLarge!.copyWith(fontSize: 30)),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text("(optional)",
                        style:
                            theme.textTheme.labelLarge!.copyWith(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                      constraints: BoxConstraints(
                          maxHeight: height * 0.3,
                          minHeight: height * 0.2,
                          maxWidth: width,
                          minWidth: width),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.deepPurple, width: 2))),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                SignUpButton(
                  buttonText: "Send Feedback",
                  color: Colors.deepPurple,
                  onPressed: () {
            
                  },
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),

              ],
            ),
          ),
        ));
  }
}
