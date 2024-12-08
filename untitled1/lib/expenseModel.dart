import 'package:flutter/material.dart';

class BudgetModel extends ChangeNotifier {
  int gelir = 0;
  int gider = 0;
  int totalMoney = 0;
  List<Map<String, dynamic>> showPage = [];

  void addGelir(int amount) {
    gelir += amount;
    totalMoney += amount;
    showPage.add({'type': 'Gelir', 'amount': amount});
  }

  void addGider(int amount) {
    gider += amount;
    totalMoney -= amount;
    showPage.add({'type': 'Gider', 'amount': amount});
    notifyListeners();
  }
}
