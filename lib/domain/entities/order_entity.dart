import 'package:get_charge/data/models/PowerBank.dart';
import 'package:get_charge/data/models/Terminal.dart';

class OrderEntity {
  final String id;
  final DateTime startTime;
  final DateTime? endTime;
  final String userId;
  final String beginTerminalId;
  final String? endTerminalId;
  final String tariffId;
  final int paymentMethodId;
  final String powerBandId;
  final int statusId;
  final int number;
  final int? price;
  final Terminal? beginTerminal;
  final Terminal? endTerminal;
  final PowerBank powerBand;

  OrderEntity({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.userId,
    required this.beginTerminalId,
    required this.endTerminalId,
    required this.tariffId,
    required this.paymentMethodId,
    required this.powerBandId,
    required this.statusId,
    required this.number,
    required this.price,
    required this.beginTerminal,
    required this.endTerminal,
    required this.powerBand
  });

}
