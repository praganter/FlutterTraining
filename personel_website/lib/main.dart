import 'package:flutter/material.dart';
import 'package:personel_website/View/home_page.dart';
import 'package:provider/provider.dart';
import 'Providers/theme_provider.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context, listen: true).themeData,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
