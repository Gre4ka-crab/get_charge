import 'package:get_charge/domain/entities/order_view_entity.dart';

class OrderViewModel extends OrderViewEntity {
  OrderViewModel({
    super.id,
    super.date,
    super.hours,
    super.number,
    super.price,
  });

  factory OrderViewModel.formMap(Map<String, dynamic> map) => OrderViewModel(
        id: map['id'],
        date: map['date'],
        hours: map['hours'],
        number: map['number'],
        price: map['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'hours': hours,
        'number': number,
        'price': price,
      };
}
