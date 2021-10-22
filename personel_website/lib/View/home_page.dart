import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personel_website/Providers/theme_provider.dart';
import 'dart:js' as js;

import 'package:personel_website/Utils/util.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  var link = [
    "https://www.linkedin.com/in/batuhan-yetgin-12b832117/",
    "https://www.instagram.com/yetginn/?hl=tr",
    "https://github.com/praganter",
    "https://twitter.com/praganter",
    "https://steamcommunity.com/id/praganter/",
    "www.google.com",
  ];
  var assetName = [
    "linkedin.png",
    "instagram.png",
    "github.png",
    "twitter.png",
    "steam.png",
    "email.png",
  ];
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
                    child: Container(color: Colors.orange),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  // color: Colors.yellow,
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
