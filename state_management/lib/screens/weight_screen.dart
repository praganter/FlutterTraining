import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/state/weight_state.dart';

class WeightScreen extends StatelessWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight Tracker Demo"),
        centerTitle: true,
      ),
      body: Consumer<WeightState>(
        builder: (context, state, widget) {Container(
          child: Column(
            children: [
              Card(),
              ListView.builder(itemBuilder: (context, index) {
                var weight = weight[index];
                return ListTile(
                  title: Text("${}"),
                );
              }),
            ],
          ),
        );
  }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
    );
  }
}
