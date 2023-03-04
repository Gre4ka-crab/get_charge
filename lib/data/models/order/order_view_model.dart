class OrderViewModel {
  final DateTime date;
  final int hours;
  final int number;
  final int price;

  OrderViewModel({
    required this.date,
    required this.hours,
    required this.number,
    required this.price,
  });

  OrderViewModel.formMap(Map<String, dynamic> map)
      : date = map['date'],
        hours = map['hours'],
        number = map['number'],
        price = map['price'];
}
