import 'package:get_charge/data/models/order/arend_time_model.dart';
import 'package:get_charge/data/models/order/power_bank_model.dart';
import 'package:get_charge/data/models/order/tariffs_model.dart';

class BeginTerminalModel {
  final String? id;
  final String? serialNumber;
  final String? title;
  final String? address;
  final int? longitude;
  final int? latitude;
  final ArendStartTimeModel? workStartTime;
  final ArendEndTimeModel? workEndTime;
  final int? numberSlots;
  final int? numberFreeSlots;
  final bool? isActive;
  final int? workingDays;
  final List<String>? orderBeginTerminals;
  final List<String>? orderEndTerminals;
  final List<PowerBankModel>? powerBanks;
  final List<TariffModel>? tariffs;

  BeginTerminalModel({
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
    this.powerBanks,
    this.tariffs,
  });

  BeginTerminalModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        serialNumber = json['serialNumber'] as String?,
        title = json['title'] as String?,
        address = json['address'] as String?,
        longitude = json['longitude'] as int?,
        latitude = json['latitude'] as int?,
        workStartTime = (json['workStartTime'] as Map<String, dynamic>?) != null
            ? ArendStartTimeModel.fromJson(json['workStartTime'] as Map<String, dynamic>)
            : null,
        workEndTime = (json['workEndTime'] as Map<String, dynamic>?) != null
            ? ArendEndTimeModel.fromJson(json['workEndTime'] as Map<String, dynamic>)
            : null,
        numberSlots = json['numberSlots'] as int?,
        numberFreeSlots = json['numberFreeSlots'] as int?,
        isActive = json['isActive'] as bool?,
        workingDays = json['workingDays'] as int?,
        orderBeginTerminals = (json['orderBeginTerminals'] as List?)?.map((dynamic e) => e as String).toList(),
        orderEndTerminals = (json['orderEndTerminals'] as List?)?.map((dynamic e) => e as String).toList(),
        powerBanks =
            (json['powerBanks'] as List?)?.map((dynamic e) => PowerBankModel.fromJson(e as Map<String, dynamic>)).toList(),
        tariffs = (json['tariffs'] as List?)?.map((dynamic e) => TariffModel.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'serialNumber': serialNumber,
        'title': title,
        'address': address,
        'longitude': longitude,
        'latitude': latitude,
        'workStartTime': workStartTime?.toJson(),
        'workEndTime': workEndTime?.toJson(),
        'numberSlots': numberSlots,
        'numberFreeSlots': numberFreeSlots,
        'isActive': isActive,
        'workingDays': workingDays,
        'orderBeginTerminals': orderBeginTerminals,
        'orderEndTerminals': orderEndTerminals,
        'powerBanks': powerBanks?.map((e) => e.toJson()).toList(),
        'tariffs': tariffs?.map((e) => e.toJson()).toList()
      };
}

class EndTerminalModel {
  final String? id;
  final String? serialNumber;
  final String? title;
  final String? address;
  final int? longitude;
  final int? latitude;
  final ArendStartTimeModel? workStartTime;
  final ArendEndTimeModel? workEndTime;
  final int? numberSlots;
  final int? numberFreeSlots;
  final bool? isActive;
  final int? workingDays;
  final List<String>? orderBeginTerminals;
  final List<String>? orderEndTerminals;
  final List<PowerBankModel>? powerBanks;
  final List<TariffModel>? tariffs;

  EndTerminalModel({
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
    this.powerBanks,
    this.tariffs,
  });

  EndTerminalModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        serialNumber = json['serialNumber'] as String?,
        title = json['title'] as String?,
        address = json['address'] as String?,
        longitude = json['longitude'] as int?,
        latitude = json['latitude'] as int?,
        workStartTime = (json['workStartTime'] as Map<String, dynamic>?) != null
            ? ArendStartTimeModel.fromJson(json['workStartTime'] as Map<String, dynamic>)
            : null,
        workEndTime = (json['workEndTime'] as Map<String, dynamic>?) != null
            ? ArendEndTimeModel.fromJson(json['workEndTime'] as Map<String, dynamic>)
            : null,
        numberSlots = json['numberSlots'] as int?,
        numberFreeSlots = json['numberFreeSlots'] as int?,
        isActive = json['isActive'] as bool?,
        workingDays = json['workingDays'] as int?,
        orderBeginTerminals = (json['orderBeginTerminals'] as List?)?.map((dynamic e) => e as String).toList(),
        orderEndTerminals = (json['orderEndTerminals'] as List?)?.map((dynamic e) => e as String).toList(),
        powerBanks = (json['powerBanks'] as List?)?.map((dynamic e) => PowerBankModel.fromJson(e as Map<String, dynamic>)).toList(),
        tariffs = (json['tariffs'] as List?)?.map((dynamic e) => TariffModel.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'serialNumber': serialNumber,
        'title': title,
        'address': address,
        'longitude': longitude,
        'latitude': latitude,
        'workStartTime': workStartTime?.toJson(),
        'workEndTime': workEndTime?.toJson(),
        'numberSlots': numberSlots,
        'numberFreeSlots': numberFreeSlots,
        'isActive': isActive,
        'workingDays': workingDays,
        'orderBeginTerminals': orderBeginTerminals,
        'orderEndTerminals': orderEndTerminals,
        'powerBanks': powerBanks?.map((e) => e.toJson()).toList(),
        'tariffs': tariffs?.map((e) => e.toJson()).toList()
      };
}
