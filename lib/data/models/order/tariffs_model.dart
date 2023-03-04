import 'package:get_charge/data/models/order/time_span_to_change_price_model.dart';

class TariffModel {
  final String? id;
  final int? pricePerDay;
  final int? pricePerHour;
  final TimeSpanToChangePriceModel? timeSpanToChangePrice;
  final String? terminalId;
  final String? terminal;
  final List<String>? orders;

  TariffModel({
    this.id,
    this.pricePerDay,
    this.pricePerHour,
    this.timeSpanToChangePrice,
    this.terminalId,
    this.terminal,
    this.orders,
  });

  TariffModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        pricePerDay = json['pricePerDay'] as int?,
        pricePerHour = json['pricePerHour'] as int?,
        timeSpanToChangePrice = (json['timeSpanToChangePrice'] as Map<String, dynamic>?) != null
            ? TimeSpanToChangePriceModel.fromJson(json['timeSpanToChangePrice'] as Map<String, dynamic>)
            : null,
        terminalId = json['terminalId'] as String?,
        terminal = json['terminal'] as String?,
        orders = (json['orders'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'pricePerDay': pricePerDay,
        'pricePerHour': pricePerHour,
        'timeSpanToChangePrice': timeSpanToChangePrice?.toJson(),
        'terminalId': terminalId,
        'terminal': terminal,
        'orders': orders
      };
}
