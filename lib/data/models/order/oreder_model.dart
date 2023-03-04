import 'package:get_charge/data/models/order/first_and_secondary_terminal_model.dart';
import 'package:get_charge/data/models/order/power_bank_model.dart';
import 'package:get_charge/data/models/order/tariffs_model.dart';

class OrderModel {
  final String? id;
  final String? startTime;
  final String? endTime;
  final String? userId;
  final String? beginTerminalId;
  final String? endTerminalId;
  final String? tariffId;
  final int? paymentType;
  final String? powerBankId;
  final int? statusId;
  final int? number;
  final int? price;
  final BeginTerminalModel? beginTerminal;
  final EndTerminalModel? endTerminal;
  final PowerBankModel? powerBank;
  final TariffModel? tariff;

  OrderModel({
    this.id,
    this.startTime,
    this.endTime,
    this.userId,
    this.beginTerminalId,
    this.endTerminalId,
    this.tariffId,
    this.paymentType,
    this.powerBankId,
    this.statusId,
    this.number,
    this.price,
    this.beginTerminal,
    this.endTerminal,
    this.powerBank,
    this.tariff,
  });

  OrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        startTime = json['startTime'] as String?,
        endTime = json['endTime'] as String?,
        userId = json['userId'] as String?,
        beginTerminalId = json['beginTerminalId'] as String?,
        endTerminalId = json['endTerminalId'] as String?,
        tariffId = json['tariffId'] as String?,
        paymentType = json['paymentType'] as int?,
        powerBankId = json['powerBankId'] as String?,
        statusId = json['statusId'] as int?,
        number = json['number'] as int?,
        price = json['price'] as int?,
        beginTerminal = (json['beginTerminal'] as Map<String,dynamic>?) != null ? BeginTerminalModel.fromJson(json['beginTerminal'] as Map<String,dynamic>) : null,
        endTerminal = (json['endTerminal'] as Map<String,dynamic>?) != null ? EndTerminalModel.fromJson(json['endTerminal'] as Map<String,dynamic>) : null,
        powerBank = (json['powerBank'] as Map<String,dynamic>?) != null ? PowerBankModel.fromJson(json['powerBank'] as Map<String,dynamic>) : null,
        tariff = (json['tariff'] as Map<String,dynamic>?) != null ? TariffModel.fromJson(json['tariff'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'startTime' : startTime,
    'endTime' : endTime,
    'userId' : userId,
    'beginTerminalId' : beginTerminalId,
    'endTerminalId' : endTerminalId,
    'tariffId' : tariffId,
    'paymentType' : paymentType,
    'powerBankId' : powerBankId,
    'statusId' : statusId,
    'number' : number,
    'price' : price,
    'beginTerminal' : beginTerminal?.toJson(),
    'endTerminal' : endTerminal?.toJson(),
    'powerBank' : powerBank?.toJson(),
    'tariff' : tariff?.toJson(),
  };
}
