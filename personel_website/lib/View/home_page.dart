// ignore_for_file: avoid_web_libraries_in_flutter, must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personel_website/Providers/theme_provider.dart';
import 'dart:js' as js;
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  var link = [
    "https://www.linkedin.com/in/batuhan-yetgin-12b832117/",
    "https://www.instagram.com/yetginn/?hl=tr",
    "https://github.com/praganter",
    "https://twitter.com/praganter",
    "https://steamcommunity.com/id/praganter/",
    "www.google.com",
    "",
  ];
  var assetName = [
    "linkedin.png",
    "instagram.png",
    "github.png",
    "twitter.png",
    "steam.png",
    "email.png",
    "cv.png",
  ];

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: false).isDark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme();
              },
              child: isDark
                  ? const Icon(
                      Icons.light_mode,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                    ),
              style: ButtonStyle(
                maximumSize: null,
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0.0),
              ),
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  // color: Colors.red,
                  ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  //! Profil
                  const Expanded(
                    flex: 3,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          "profile.jpeg",
                        ),
                        maxRadius: 300,
                        minRadius: 100,
                      ),
                    ),
                  ),
                  //const SizedBox(height: 10),
                  //! İsim
                  Expanded(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "Batuhan YETGİN",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            // fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //const SizedBox(height: 10),
                  //!SOSYAL MEDYA
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: link.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: customButtons(
                              link[index], assetName[index], isDark),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      alignment: Alignment.center,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "© 2021 Batuhan YETGİN - Made with Flutter",
                    style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customButtons(String link, String assetName, bool isDark) {
    return InkWell(
      focusColor: Colors.red,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      highlightColor: Colors.transparent,
      child: Image.asset(
        assetName,
        fit: BoxFit.fill,
        gaplessPlayback: true,
        isAntiAlias: true,
        filterQuality: FilterQuality.low,
        color: isDark ? Colors.white : Colors.black,
      ),
      onTap: () {
        assetName == "email.png"
            ? js.context.callMethod('openMailApp')
            : js.context.callMethod('open', [link]);
      },
    );
  }
}
