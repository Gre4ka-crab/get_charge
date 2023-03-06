import 'package:get_charge/domain/entities/power_bank_entity.dart';
import 'package:get_charge/domain/entities/tariff_entity.dart';
import 'package:get_charge/domain/entities/terminal_entity.dart';

class OrderEntity {
  final String? id;
  final DateTime? startTime;
  final DateTime? endTime;
  final TariffEntity? tariff;
  final PowerBankEntity? powerBank;
  final int? statusId;
  final int? number;
  final int? price;
  final TerminalEntity? beginTerminal;
  final TerminalEntity? endTerminal;

  OrderEntity({
    this.id,
    this.startTime,
    this.endTime,
    this.statusId,
    this.number,
    this.price,
    this.beginTerminal,
    this.endTerminal,
    this.powerBank,
    this.tariff
  });

}
