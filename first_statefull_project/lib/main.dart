import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            centerTitle: true,
            title: Text(
              "Bugün Ne Yesek",
              style: GoogleFonts.arimo(color: Colors.white70),
            ),
          ),
          body: DishPage()),
    );
  }
}

class DishPage extends StatefulWidget {
  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;
  List<String> corbaAdlari = [
    "Mercimek Çorbası",
    "Tarhana Çorbası",
    "Tavuksuyu Çorbası",
    "Düğün Çorbası",
    "Yoğurtlu Çorbası",
  ];
  List<String> yemekAdlari = [
    "Karnıyarık",
    "Mantı",
    "Kuru Fasulye",
    "İçli Köfte",
    "Izgara Balık",
  ];
  List<String> tatliAdlari = [
    "Kadayıf",
    "Baklava",
    "Sütlaç",
    "Kazandibi ",
    "Dondurma",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: TextButton(
              onPressed: randomDish,
              child: Image.asset(
                'images/corba_$corbaNo.jpg',
              ),
            ),
          ),
          Text(
            corbaAdlari[corbaNo - 1],
            style: GoogleFonts.farro(
              color: Colors.white,
            ),
          ),
          Container(
            width: 350.0,
            child: Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: randomDish,
              child: Image.asset(
                'images/yemek_$yemekNo.jpg',
              ),
            ),
          ),
          Text(
            yemekAdlari[yemekNo - 1],
            style: GoogleFonts.farro(
              color: Colors.white,
            ),
          ),
          Container(
            width: 350.0,
            child: Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: randomDish,
              child: Image.asset(
                'images/tatli_$tatliNo.jpg',
              ),
            ),
          ),
          Text(
            tatliAdlari[tatliNo - 1],
            style: GoogleFonts.farro(
              color: Colors.white,
            ),
          ),
          Container(
            width: 350.0,
            child: Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  void randomDish() {
    setState(() {
      corbaNo = Random().nextInt(4) + 1;
      yemekNo = Random().nextInt(4) + 1;
      tatliNo = Random().nextInt(4) + 1;
    });
  }
}
