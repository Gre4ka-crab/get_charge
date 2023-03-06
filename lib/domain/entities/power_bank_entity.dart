class PowerBankEntity {
  final String? id;
  final String? terminalId;
  final int? charge;
  final String? serialNumber;
  final String? terminal;
  final List<String>? orders;

  PowerBankEntity({
    this.id,
    this.terminalId,
    this.charge,
    this.serialNumber,
    this.terminal,
    this.orders,
  });
}