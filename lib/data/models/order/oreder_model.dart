import 'package:get_charge/data/models/order/terminal_model.dart';
import 'package:get_charge/data/models/order/power_bank_model.dart';
import 'package:get_charge/data/models/order/tariffs_model.dart';
import 'package:get_charge/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  final String? userId;
  final String? beginTerminalId;
  final String? endTerminalId;
  final String? tariffId;
  final int? paymentType;
  final String? powerBankId;

  OrderModel({
    required super.id,
    required super.startTime,
    super.endTime,
    this.userId,
    this.beginTerminalId,
    this.endTerminalId,
    this.tariffId,
    this.paymentType,
    this.powerBankId,
    required super.statusId,
    required super.number,
    super.price,
    super.beginTerminal,
    super.endTerminal,
    super.powerBank,
    super.tariff,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      startTime: json['startTime'] as DateTime?,
      endTime: json['endTime'] as DateTime?,
      userId: json['userId'] as String?,
      beginTerminalId: json['beginTerminalId'] as String?,
      endTerminalId: json['endTerminalId'] as String?,
      tariffId: json['tariffId'] as String?,
      paymentType: json['paymentType'] as int?,
      powerBankId: json['powerBankId'] as String?,
      statusId: json['statusId'] as int?,
      number: json['number'] as int?,
      price: json['price'] as int?,
      beginTerminal: (json['beginTerminal'] as Map<String, dynamic>?) != null
          ? TerminalModel.fromJson(json['beginTerminal'] as Map<String, dynamic>)
          : null,
      endTerminal: (json['endTerminal'] as Map<String, dynamic>?) != null
          ? TerminalModel.fromJson(json['endTerminal'] as Map<String, dynamic>)
          : null,
      powerBank: (json['powerBank'] as Map<String, dynamic>?) != null
          ? PowerBankModel.fromJson(json['powerBank'] as Map<String, dynamic>)
          : null,
      tariff: (json['tariff'] as Map<String, dynamic>?) != null
          ? TariffModel.fromJson(json['tariff'] as Map<String, dynamic>)
          : null);

  Map<String, dynamic> toJson() => {
        'id': id,
        'startTime': startTime,
        'endTime': endTime,
        'userId': userId,
        'beginTerminalId': beginTerminalId,
        'endTerminalId': endTerminalId,
        'tariffId': tariffId,
        'paymentType': paymentType,
        'powerBankId': powerBankId,
        'statusId': statusId,
        'number': number,
        'price': price,
        'beginTerminal': (beginTerminal as TerminalModel?)?.toJson(),
        'endTerminal': (endTerminal as TerminalModel?)?.toJson(),
        'powerBank': (powerBank as PowerBankModel?)?.toJson(),
        'tariff': (tariff as TariffModel?)?.toJson(),
      };
}
