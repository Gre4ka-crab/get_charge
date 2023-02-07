import 'package:flutter/material.dart';

class Tariff {
  final String id;
  final int pricePerDay;
  final int pricePerHour;
  final TimeOfDay timeSpanToChangePrice;

  Tariff({
    required this.id,
    required this.pricePerDay,
    required this.pricePerHour,
    required this.timeSpanToChangePrice,
  });
}
