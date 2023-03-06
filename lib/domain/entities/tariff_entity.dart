class TariffEntity {
  final String? id;
  final int? pricePerDay;
  final int? pricePerHour;
  final Duration? changePrice;
  final String? terminalId;
  final String? terminal;
  final List<String>? orders;

  TariffEntity({
    this.id,
    this.pricePerDay,
    this.pricePerHour,
    this.changePrice,
    this.terminalId,
    this.terminal,
    this.orders,
  });
}
