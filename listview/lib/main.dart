import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var list = [
    ListTile(
      tileColor: Colors.red,
      title: Text("1."),
    ),
    ListTile(
      tileColor: Colors.green,
      title: Text("2."),
    ),
    ListTile(
      tileColor: Colors.blue,
      title: Text("3."),
    )
  ];

  List<String> strList = ["batuhan", "ilayda", "eren", "berrun"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: FractionallySizedBox(
            //widthFactor: 0.9,
            heightFactor: 0.6,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, _) {
                return Divider(
                  height: 5,
                  color: Colors.blue,
                );
              },
              itemCount: strList.length,
              itemBuilder: (context, index) {
                var container = strList
                    .map((e) => Container(
                        height: 100.0,
                        width: 100.0,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        color: Colors.red,
                        child: Text(e)))
                    .toList();
                return container[index];
              },
              //children: list,
            ),
          ),
        ),
      ),
    );
  }
}
