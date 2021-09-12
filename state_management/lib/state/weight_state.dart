import 'package:flutter/material.dart';
import 'package:state_management/modals/weight_modal.dart';

class WeightState with ChangeNotifier {
  List<Weight> _weights = [
    Weight(64, DateTime.utc(2019, 10, 4)),
    Weight(65, DateTime.utc(2019, 10, 5)),
    Weight(66, DateTime.utc(2019, 10, 6)),
    Weight(67, DateTime.utc(2019, 10, 7)),
  ];

  List<Weight> get weights => _weights;

  addWeight(Weight weight) {
    _weights.add(weight);
    notifyListeners();
  }
}
