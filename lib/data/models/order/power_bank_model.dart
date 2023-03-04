class PowerBankModel {
  final String? id;
  final String? terminalId;
  final int? charge;
  final String? serialNumber;
  final String? terminal;
  final List<String>? orders;

  PowerBankModel({
    this.id,
    this.terminalId,
    this.charge,
    this.serialNumber,
    this.terminal,
    this.orders,
  });

  PowerBankModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        terminalId = json['terminalId'] as String?,
        charge = json['charge'] as int?,
        serialNumber = json['serialNumber'] as String?,
        terminal = json['terminal'] as String?,
        orders = (json['orders'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'terminalId': terminalId,
        'charge': charge,
        'serialNumber': serialNumber,
        'terminal': terminal,
        'orders': orders
      };
}
