import 'package:flutter/material.dart';

class MapsViewModel with ChangeNotifier {
  Future<void> fetchMapData(String value) async {
    notifyListeners();
  }
}
