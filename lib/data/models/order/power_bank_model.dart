import 'package:get_charge/domain/entities/power_bank_entity.dart';

class PowerBankModel extends PowerBankEntity {
  PowerBankModel({
    super.id,
    super.terminalId,
    super.charge,
    super.serialNumber,
    super.terminal,
    super.orders,
  });

  factory PowerBankModel.fromJson(Map<String, dynamic> json)=> PowerBankModel(
      id: json['id'] as String?,
      terminalId: json['terminalId'] as String?,
      charge: json['charge'] as int?,
      serialNumber: json['serialNumber'] as String?,
      terminal: json['terminal'] as String?,
      orders: (json['orders'] as List?)?.map((dynamic e) => e as String).toList()
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'terminalId': terminalId,
        'charge': charge,
        'serialNumber': serialNumber,
        'terminal': terminal,
        'orders': orders
      };
}
