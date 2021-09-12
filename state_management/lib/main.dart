import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/screens/weight_screen.dart';
import 'package:state_management/state/weight_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeightSate(),
        ),
      ],
      child: MaterialApp(
        title: "Provider Demo",
        debugShowCheckedModeBanner: false,
        home: WeightScreen(),
      ),
    );
  }
}
