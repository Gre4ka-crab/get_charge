class LeaseDetail {
  String name;
  DateTime? startTime;
  DateTime? endTime;
  int terminalId;
  String address;

  LeaseDetail({
    required this.name,
    this.startTime,
    this.endTime,
    required this.terminalId,
    required this.address,
  });
}

class TransactionHistory{
  int id;
  int price;

  TransactionHistory({required this.id, required this.price});
}

class Lease{
  int id;
  DateTime leaseDate;
  double leaseHour;
  int price;
  String rate;
  String duration;
  List<LeaseDetail>? detail;
  List<TransactionHistory>? history;

  Lease({
    required this.id,
    required this.leaseDate,
    required this.leaseHour,
    required this.price,
    required this.rate,
    required this.duration,
    this.detail,
    this.history,
  });
}