// ignore_for_file: avoid_web_libraries_in_flutter, must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personel_website/Providers/theme_provider.dart';
import 'package:personel_website/View/cv_page.dart';
import 'dart:js' as js;
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var assetName = [
    "linkedin.png",
    "instagram.png",
    "github.png",
    "twitter.png",
    "steam.png",
    "email.png",
    "cv.png",
  ];

  var link = [
    "https://www.linkedin.com/in/batuhan-yetgin-12b832117/",
    "https://www.instagram.com/yetginn/?hl=tr",
    "https://github.com/praganter",
    "https://twitter.com/praganter",
    "https://steamcommunity.com/id/praganter/",
    "www.google.com",
    "",
  ];

  Widget customButtons(String link, String assetName, bool isDark, context) {
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
        switch (assetName) {
          case "cv.png":
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => PdfPage(),
            //   ),
            // );
            null;
            break;
          case "email.png":
            js.context.callMethod('openMailApp');
            break;
          default:
            js.context.callMethod('open', [link]);
        }
      },
    );
  }

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
                      fit: BoxFit.contain,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          "profile.jpeg",
                        ),
                        maxRadius: 250,
                        minRadius: 100,
                      ),
                    ),
                  ),
                  //! İsim
                  Expanded(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.contain,
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
                  //!SOSYAL MEDYA
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: link.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: customButtons(
                              link[index], assetName[index], isDark, context),
                        ),
                      ),
                    ),
                  ),
                  //!AÇIKLAMA
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      alignment: Alignment.center,
                      child: Text(
                        "",
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
}
