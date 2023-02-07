class OrderView {
  final DateTime date;
  final int hours;
  final int number;
  final int price;

  OrderView({
    required this.date,
    required this.hours,
    required this.number,
    required this.price,
  });

  OrderView.formMap(Map<String, dynamic> map)
      : date = map['date'],
        hours = map['hours'],
        number = map['number'],
        price = map['price'];
}
