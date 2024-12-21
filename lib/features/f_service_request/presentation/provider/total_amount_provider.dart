import 'package:flutter/material.dart';

class TotalAmountProvider with ChangeNotifier {
  final Map<Key, double> cardAmounts = {};

  double get getTotalAmount {
    return cardAmounts.values.fold(0, (sum, amount) => sum + amount);
  }

  void updateCardAmount(Key cardKey, double amount) {
    cardAmounts[cardKey] = amount;
    notifyListeners();
  }

  void removeCard(Key cardKey) {
    cardAmounts.remove(cardKey);
    notifyListeners();
  }
}
