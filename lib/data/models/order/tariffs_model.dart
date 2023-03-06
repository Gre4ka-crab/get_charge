import 'package:get_charge/data/models/order/time_span_to_change_price_model.dart';
import 'package:get_charge/domain/entities/tariff_entity.dart';

class TariffModel extends TariffEntity {
  TariffModel({
    super.id,
    super.pricePerDay,
    super.pricePerHour,
    super.changePrice,
    super.terminalId,
    super.terminal,
    super.orders,
  });

  factory TariffModel.fromJson(Map<String, dynamic> json) => TariffModel(
        id: json['id'] as String?,
        pricePerDay: json['pricePerDay'] as int?,
        pricePerHour: json['pricePerHour'] as int?,
        changePrice: TimeSpanToChangePriceModel.fromJson(json['timeSpanToChangePrice']).toDuration(),
        terminalId: json['terminalId'] as String?,
        terminal: json['terminal'] as String?,
        orders: (json['orders'] as List?)?.map((dynamic e) => e as String).toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pricePerDay': pricePerDay,
        'pricePerHour': pricePerHour,
        'changePrice': changePrice?.inSeconds,
        'terminalId': terminalId,
        'terminal': terminal,
        'orders': orders
      };
}
