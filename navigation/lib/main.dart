import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.grey),

      ///home: HomePage(),
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        RoutePink.route: (context) => RoutePink(),
        RouteGreen.route: (context) => RouteGreen(),
        RouteGrey.route: (context) => RouteGrey(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static String route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('HomePage'),
        RaisedButton(
            child: Text('Git -> Route Pink'),
            onPressed: () {
              Navigator.pushNamed(context, RoutePink.route);
            })
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {
  static String route = 'pink';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RoutePink en üstte'),
        RaisedButton(
            child: Text('Git -> Route Green'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGreen.route);
            }),
        RaisedButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////
class RouteGreen extends StatelessWidget {
  static String route = 'green';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RouteGreen en üstte'),
        RaisedButton(
            child: Text('Git -> Route Grey'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGrey.route);
            }),
        RaisedButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////
class RouteGrey extends StatelessWidget {
  static String route = 'grey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RouteGrey en üstte'),
        RaisedButton(
            child: Text('Git -> ....'),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomePage.route, (route) => false);
            }),
        RaisedButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            }),
      ])),
    );
  }
}
