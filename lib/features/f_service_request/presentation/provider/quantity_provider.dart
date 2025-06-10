import 'package:flutter/material.dart';

class QuantityProvider with ChangeNotifier {
  int quantity = 0;
  double totalAmount = 0.0;

  int get getQuantity => quantity;
  double get getTotalAmount => totalAmount;
  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    if (quantity > 0) {
      quantity--;
      notifyListeners();
    }
  }
}
