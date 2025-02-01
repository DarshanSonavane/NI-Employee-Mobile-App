import 'package:flutter/material.dart';

class TotalAmountProvider with ChangeNotifier {
  final Map<Key, double> cardAmounts = {};

  double get getTotalAmount {
    return cardAmounts.values.fold(0, (sum, amount) => sum + amount);
  }

  double get getTotalAmountInclGst {
    double totalAmount = getTotalAmount;
    double gst = totalAmount * 0.18;
    return totalAmount + gst;
  }

  void updateCardAmount(Key cardKey, double amount) {
    if (cardAmounts[cardKey] != amount) {
      cardAmounts[cardKey] = amount;
      notifyListeners();
    }
  }

  void removeCard(Key cardKey) {
    if (cardAmounts.containsKey(cardKey)) {
      cardAmounts[cardKey]!;
      cardAmounts.remove(cardKey);
      notifyListeners();
    }
  }
}
