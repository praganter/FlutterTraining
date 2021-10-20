import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Get.isDarkMode
                        ? Get.changeThemeMode(ThemeMode.light)
                        : Get.changeThemeMode(ThemeMode.dark);
                  });
                },
                child: Get.isDarkMode
                    ? const Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.light_mode,
                        color: Colors.white,
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
        body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
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
                            maxRadius: 300,
                            minRadius: 100,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //! İsim
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              "Batuhan YETGİN",
                              style: TextStyle(
                                color: (Get.isDarkMode)
                                    ? Colors.black
                                    : Colors.white,
                                // fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //!SOSYAL MEDYA
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customButton("github"),
                            customButton("github"),
                            customButton("github"),
                            customButton("github"),
                            customButton("github"),
                            customButton("github"),
                          ],
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
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customButton(String iconName) {
    String link = "websiteName";
    switch (iconName) {
      case "github":
        link = "";
        break;
      default:
    }
    return InkWell(child: Image.asset("github.png"));
    // return ElevatedButton(
    //   onPressed: () {
    //     js.context.callMethod('open', [link]);
    //   },
    //   //achild: Image.asset(filePath),
    //   style: ButtonStyle(
    //     overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
    //     foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    //     backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    //     elevation: MaterialStateProperty.all<double>(0.0),
    //   ),
    // );
  }
}
