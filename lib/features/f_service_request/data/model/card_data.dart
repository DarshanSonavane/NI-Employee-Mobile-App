import 'package:flutter/material.dart';

import '../../presentation/provider/quantity_provider.dart';

class CardData {
  final Key key;
  final QuantityProvider quantityProvider;

  CardData({
    required this.key,
    QuantityProvider? quantityProvider,
  }) : quantityProvider = quantityProvider ?? QuantityProvider();
}
