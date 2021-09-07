import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.internethaber.com/storage/files/images/2019/12/05/turk-kahvesi-dxsI_cover.jpg"),
                  radius: 80,
                ),
                Text(
                  "Flutter Kahvecisi",
                  style: GoogleFonts.satisfy(
                    fontStyle: FontStyle.italic,
                    fontSize: 36.0,
                  ),
                ),
                Text(
                  "BİR FİNCAN UZAĞINIZDA",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 200.0,
                  child: Divider(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Card(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 55.0),
                  //padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    title: Text(
                      "byetgin@engineer.com",
                      style: GoogleFonts.comicNeue(
                          color: Colors.green, fontSize: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 55.0),
                  //padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    title: Text(
                      "byetgin@engineer.com",
                      style: GoogleFonts.comicNeue(
                          color: Colors.green, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowluOrnek extends StatelessWidget {
  const RowluOrnek({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(18.0)),
              padding: EdgeInsets.all(4.0),
              //margin: EdgeInsets.all(12.0),
              child: Text(
                "Batuhan Yetgin",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(18.0)),
              padding: EdgeInsets.all(4.0),
              //margin: EdgeInsets.all(12.0),
              child: Text(
                "Batuhan Yetgin",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(18.0)),
              padding: EdgeInsets.all(4.0),
              //margin: EdgeInsets.all(12.0),
              child: Text(
                "Batuhan Yetgin",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(18.0)),
              padding: EdgeInsets.all(4.0),
              //margin: EdgeInsets.all(12.0),
              child: Text(
                "Batuhan Yetgin",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(18.0)),
              padding: EdgeInsets.all(4.0),
              //margin: EdgeInsets.all(12.0),
              child: Text(
                "Batuhan Yetgin",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(18.0)),
              padding: EdgeInsets.all(4.0),
              //margin: EdgeInsets.all(12.0),
              child: Text(
                "Batuhan Yetgin",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(18.0)),
              padding: EdgeInsets.all(4.0),
              //margin: EdgeInsets.all(12.0),
              child: Text(
                "Batuhan Yetgin",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(18.0)),
              padding: EdgeInsets.all(4.0),
              //margin: EdgeInsets.all(12.0),
              child: Text(
                "Batuhan Yetgin",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
