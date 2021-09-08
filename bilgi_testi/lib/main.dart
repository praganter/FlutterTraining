import 'package:bilgi_testi/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> answerIcons = [];
  List<String> questions = [
    "Titanic gelmiş geçmiş en büyük gemidir",
    "Dünyadaki tavuk sayısı insan sayısından fazladır",
    "Kelebeklerin ömrü bir gündür",
    "Dünya düzdür",
    "Kaju fıstığı aslında bir meyvenin sapıdır",
    "Fatih Sultan Mehmet hiç patates yememiştir",
    "Fransızlar 80 demek için, 4 - 20 der"
  ];
  List<bool> answers = [false, true, false, false, true, true];
  int questionOrder = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionOrder],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          runSpacing: 25,
          spacing: 10,
          children: answerIcons,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        checkAnswer(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void checkAnswer(bool button) {
    setState(() {
      while (questionOrder < questions.length) {
        if (button) {
          answers[questionOrder] == button
              ? answerIcons.add(CorrectAnswer)
              : answerIcons.add(WrongAnswer);
        } else {
          answers[questionOrder] == button
              ? answerIcons.add(CorrectAnswer)
              : answerIcons.add(WrongAnswer);
        }
        _showDialog();
      }
      // button == true
      //     ? answerIcons.add(CorrectAnswer)
      //     : answerIcons.add(WrongAnswer);
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void appReset() {
    questionOrder = 0;
    answerIcons = [];
  }
}
