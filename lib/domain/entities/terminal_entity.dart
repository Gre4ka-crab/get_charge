import 'package:get_charge/domain/entities/power_bank_entity.dart';
import 'package:get_charge/domain/entities/tariff_entity.dart';

class TerminalEntity {
  final String? id;
  final String? serialNumber;
  final String? title;
  final String? address;
  final int? longitude;
  final int? latitude;
  final Duration? workStartTime;
  final Duration? workEndTime;
  final int? numberSlots;
  final int? numberFreeSlots;
  final bool? isActive;
  final int? workingDays;
  final List<String>? orderBeginTerminals;
  final List<String>? orderEndTerminals;
  final PowerBankEntity? powerBank;
  final TariffEntity? tariff;


  TerminalEntity({
    this.id,
    this.serialNumber,
    this.title,
    this.address,
    this.longitude,
    this.latitude,
    this.workStartTime,
    this.workEndTime,
    this.numberSlots,
    this.numberFreeSlots,
    this.isActive,
    this.workingDays,
    this.orderBeginTerminals,
    this.orderEndTerminals,
    this.powerBank,
    this.tariff,
  });
}