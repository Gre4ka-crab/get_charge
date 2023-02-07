import 'package:flutter/material.dart';
import 'package:get_charge/data/models/PowerBank.dart';

class Terminal {
  final int id;
  final String title;
  final String address;
  final double longitude;
  final double latitude;
  final TimeOfDay workStartTime;
  final TimeOfDay? workEndTime;
  final int numberSlots;
  final int numberFreeSlots;
  final List<PowerBank> powerBank;

  Terminal({
    required this.id,
    required this.title,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.workStartTime,
    required this.workEndTime,
    required this.numberSlots,
    required this.numberFreeSlots,
    required this.powerBank,
  });
}
