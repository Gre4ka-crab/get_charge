import 'package:get_charge/data/models/order/power_bank_model.dart';
import 'package:get_charge/data/models/order/tariffs_model.dart';
import 'package:get_charge/data/models/order/time_span_to_change_price_model.dart';
import 'package:get_charge/domain/entities/terminal_entity.dart';

class TerminalModel extends TerminalEntity {

  TerminalModel({
    super.id,
    super.serialNumber,
    super.title,
    super.address,
    super.longitude,
    super.latitude,
    super.workStartTime,
    super.workEndTime,
    super.numberSlots,
    super.numberFreeSlots,
    super.isActive,
    super.workingDays,
    super.powerBank,
    super.tariff,
  });

  factory TerminalModel.fromJson(Map<String, dynamic> json) => TerminalModel(
      id: json['id'] as String?,
      serialNumber: json['serialNumber'] as String?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      longitude: json['longitude'] as int?,
      latitude: json['latitude'] as int?,
      workStartTime: TimeSpanToChangePriceModel.fromJson(json['workStartTime']).toDuration(),
      workEndTime: TimeSpanToChangePriceModel.fromJson(json['workEndTime']).toDuration(),
      numberSlots: json['numberSlots'] as int?,
      numberFreeSlots: json['numberFreeSlots'] as int?,
      isActive: json['isActive'] as bool?,
      workingDays: json['workingDays'] as int?,
      powerBank: PowerBankModel.fromJson(json['powerBank']),
      tariff: TariffModel.fromJson(json['tariff']),
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'serialNumber': serialNumber,
        'title': title,
        'address': address,
        'longitude': longitude,
        'latitude': latitude,
        'workStartTime': workStartTime?.inSeconds,
        'workEndTime': workEndTime?.inSeconds,
        'numberSlots': numberSlots,
        'numberFreeSlots': numberFreeSlots,
        'isActive': isActive,
        'workingDays': workingDays,
        'orderBeginTerminals': orderBeginTerminals,
        'orderEndTerminals': orderEndTerminals,
        'powerBank': (powerBank as PowerBankModel).toJson(),
        'tariff': (tariff as TariffModel).toJson()
      };
}
